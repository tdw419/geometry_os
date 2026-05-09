; DESCRIPTION: Composite: Renders a yellow disk with center (145, 216) and radius 14 then Draws a orange line from (440, 206) to (265, 209).
; PLAN: r0=145(x), r1=216(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x1), r6=206(y1), r7=265(x2), r8=209(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 216
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 206
LDI r7, 265
LDI r8, 209
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
