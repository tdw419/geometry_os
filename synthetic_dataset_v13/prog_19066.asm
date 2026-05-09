; DESCRIPTION: Composite: Draws a magenta line from (457, 210) to (215, 185) then Places a purple dot at position (106, 85) then Renders a black box of size 101x69 starting at (161, 64).
; PLAN: r0=457(x1), r1=210(y1), r2=215(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=85(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=64(y), r12=101(width), r13=69(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 210
LDI r2, 215
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 85
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 161
LDI r11, 64
LDI r12, 101
LDI r13, 69
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
