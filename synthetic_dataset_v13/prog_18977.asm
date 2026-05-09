; DESCRIPTION: Composite: Draws a white line from (326, 23) to (4, 11) then Renders a blue disk with center (85, 152) and radius 77.
; PLAN: r0=326(x1), r1=23(y1), r2=4(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=152(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 23
LDI r2, 4
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 152
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
