; DESCRIPTION: Composite: Draws a magenta line from (444, 198) to (82, 49) then Renders a green disk with center (370, 148) and radius 52.
; PLAN: r0=444(x1), r1=198(y1), r2=82(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=148(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 198
LDI r2, 82
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 148
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
