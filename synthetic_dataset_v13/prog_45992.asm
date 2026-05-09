; DESCRIPTION: Composite: Places a cyan line segment connecting (119, 67) to (229, 64) then Places a magenta dot at position (40, 72) then Draws a yellow rectangle at (187, 189) with width 116 and height 15.
; PLAN: r0=119(x1), r1=67(y1), r2=229(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=72(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=189(y), r12=116(width), r13=15(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 67
LDI r2, 229
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 72
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 187
LDI r11, 189
LDI r12, 116
LDI r13, 15
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
