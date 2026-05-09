; DESCRIPTION: Composite: Places a blue dot at position (69, 147) then Renders a orange box of size 106x95 starting at (180, 87) then Draws a red line from (215, 88) to (182, 151).
; PLAN: r0=69(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=87(y), r7=106(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x1), r11=88(y1), r12=182(x2), r13=151(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 87
LDI r7, 106
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 88
LDI r12, 182
LDI r13, 151
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
