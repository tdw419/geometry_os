; DESCRIPTION: Composite: Draws a orange line from (211, 111) to (216, 10) then Renders a blue disk with center (110, 186) and radius 13.
; PLAN: r0=211(x1), r1=111(y1), r2=216(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=186(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 111
LDI r2, 216
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 186
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
