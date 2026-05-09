; DESCRIPTION: Composite: Places a green line segment connecting (503, 108) to (420, 53) then Places a white circle of radius 32 at center (394, 108).
; PLAN: r0=503(x1), r1=108(y1), r2=420(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=108(y), r7=32(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 503
LDI r1, 108
LDI r2, 420
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 108
LDI r7, 32
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
