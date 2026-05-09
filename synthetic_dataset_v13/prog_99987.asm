; DESCRIPTION: Composite: Draws a blue circle centered at (293, 213) with radius 39 then Renders a green line between points (250, 181) and (68, 18).
; PLAN: r0=293(x), r1=213(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x1), r6=181(y1), r7=68(x2), r8=18(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 213
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 181
LDI r7, 68
LDI r8, 18
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
