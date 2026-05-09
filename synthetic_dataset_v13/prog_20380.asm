; DESCRIPTION: Composite: Places a magenta dot at position (194, 114) then Places a red 95x87 rectangle at position (82, 164) then Places a blue line segment connecting (234, 14) to (191, 105).
; PLAN: r0=194(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=164(y), r7=95(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x1), r11=14(y1), r12=191(x2), r13=105(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 164
LDI r7, 95
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 14
LDI r12, 191
LDI r13, 105
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
