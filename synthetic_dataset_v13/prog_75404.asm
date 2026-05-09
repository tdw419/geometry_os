; DESCRIPTION: Composite: Draws a green circle centered at (416, 172) with radius 46 then Renders a yellow line between points (111, 243) and (270, 68).
; PLAN: r0=416(x), r1=172(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x1), r6=243(y1), r7=270(x2), r8=68(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 172
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 243
LDI r7, 270
LDI r8, 68
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
