; DESCRIPTION: Composite: Renders a magenta box of size 63x72 starting at (282, 97) then Places a magenta line segment connecting (114, 212) to (473, 47) then Places a black dot at position (157, 196).
; PLAN: r0=282(x), r1=97(y), r2=63(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x1), r6=212(y1), r7=473(x2), r8=47(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=196(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 97
LDI r2, 63
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 212
LDI r7, 473
LDI r8, 47
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 196
LDI r12, 0x000000
PSET r10, r11, r12
HALT
