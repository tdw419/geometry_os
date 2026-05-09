; DESCRIPTION: Composite: Draws a purple line from (91, 15) to (25, 97) then Renders a green disk with center (245, 184) and radius 32.
; PLAN: r0=91(x1), r1=15(y1), r2=25(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=184(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 15
LDI r2, 25
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 184
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
