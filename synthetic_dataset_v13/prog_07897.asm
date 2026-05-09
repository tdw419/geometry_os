; DESCRIPTION: Composite: Places a yellow line segment connecting (509, 243) to (352, 216) then Draws a purple circle centered at (167, 97) with radius 34.
; PLAN: r0=509(x1), r1=243(y1), r2=352(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=97(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 509
LDI r1, 243
LDI r2, 352
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 97
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
