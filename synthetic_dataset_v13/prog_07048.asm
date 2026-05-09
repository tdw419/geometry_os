; DESCRIPTION: Composite: Draws a orange line from (263, 40) to (115, 97) then Renders a blue disk with center (138, 126) and radius 70.
; PLAN: r0=263(x1), r1=40(y1), r2=115(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=126(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 40
LDI r2, 115
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 126
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
