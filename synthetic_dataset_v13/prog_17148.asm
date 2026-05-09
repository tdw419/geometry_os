; DESCRIPTION: Composite: Sets a single yellow pixel at (140, 13) then Draws a magenta rectangle at (133, 126) with width 113 and height 79 then Renders a red disk with center (68, 75) and radius 11.
; PLAN: r0=140(x), r1=13(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=126(y), r7=113(width), r8=79(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=75(y), r12=11(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 140
LDI r1, 13
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 133
LDI r6, 126
LDI r7, 113
LDI r8, 79
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 75
LDI r12, 11
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
