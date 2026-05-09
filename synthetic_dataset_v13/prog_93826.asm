; DESCRIPTION: Composite: Places a white circle of radius 38 at center (340, 58) then Places a red line segment connecting (28, 60) to (254, 82).
; PLAN: r0=340(x), r1=58(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x1), r6=60(y1), r7=254(x2), r8=82(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 58
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 60
LDI r7, 254
LDI r8, 82
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
