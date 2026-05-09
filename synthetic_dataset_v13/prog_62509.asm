; DESCRIPTION: Composite: Places a blue dot at position (352, 224) then Draws a yellow line from (45, 59) to (162, 166) then Draws a magenta rectangle at (193, 96) with width 24 and height 59.
; PLAN: r0=352(x), r1=224(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=59(y1), r7=162(x2), r8=166(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=96(y), r12=24(width), r13=59(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 224
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 59
LDI r7, 162
LDI r8, 166
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 96
LDI r12, 24
LDI r13, 59
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
