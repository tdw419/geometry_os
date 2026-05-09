; DESCRIPTION: Composite: Places a blue circle of radius 68 at center (256, 82) then Places a red line segment connecting (299, 98) to (181, 184).
; PLAN: r0=256(x), r1=82(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=98(y1), r7=181(x2), r8=184(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 82
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 98
LDI r7, 181
LDI r8, 184
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
