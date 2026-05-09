; DESCRIPTION: Composite: Places a green line segment connecting (9, 242) to (200, 99) then Places a white circle of radius 31 at center (289, 36).
; PLAN: r0=9(x1), r1=242(y1), r2=200(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=36(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 242
LDI r2, 200
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 36
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
