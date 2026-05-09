; DESCRIPTION: Composite: Draws a green circle centered at (86, 186) with radius 39 then Renders a blue line between points (209, 49) and (144, 243).
; PLAN: r0=86(x), r1=186(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=49(y1), r7=144(x2), r8=243(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 186
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 49
LDI r7, 144
LDI r8, 243
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
