; DESCRIPTION: Composite: Renders a orange line between points (275, 222) and (118, 98) then Places a green 18x77 rectangle at position (145, 77) then Draws a magenta circle centered at (208, 102) with radius 67.
; PLAN: r0=275(x1), r1=222(y1), r2=118(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=77(y), r7=18(width), r8=77(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=102(y), r12=67(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 275
LDI r1, 222
LDI r2, 118
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 77
LDI r7, 18
LDI r8, 77
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 102
LDI r12, 67
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
