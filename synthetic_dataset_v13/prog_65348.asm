; DESCRIPTION: Composite: Draws a red circle centered at (283, 144) with radius 44 then Renders a yellow line between points (220, 44) and (127, 214).
; PLAN: r0=283(x), r1=144(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x1), r6=44(y1), r7=127(x2), r8=214(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 144
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 44
LDI r7, 127
LDI r8, 214
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
