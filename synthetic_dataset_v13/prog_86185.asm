; DESCRIPTION: Composite: Sets a single green pixel at (251, 43) then Renders a blue line between points (145, 12) and (64, 131) then Draws a magenta rectangle at (8, 25) with width 71 and height 69.
; PLAN: r0=251(x), r1=43(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=145(x1), r6=12(y1), r7=64(x2), r8=131(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=8(x), r11=25(y), r12=71(width), r13=69(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 43
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 145
LDI r6, 12
LDI r7, 64
LDI r8, 131
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 8
LDI r11, 25
LDI r12, 71
LDI r13, 69
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
