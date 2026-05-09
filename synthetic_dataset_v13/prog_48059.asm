; DESCRIPTION: Composite: Creates a magenta rectangular region at (318, 18) spanning 37 by 47 pixels then Renders a yellow line between points (460, 185) and (220, 191).
; PLAN: r0=318(x), r1=18(y), r2=37(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x1), r6=185(y1), r7=220(x2), r8=191(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 18
LDI r2, 37
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 185
LDI r7, 220
LDI r8, 191
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
