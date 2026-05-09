; DESCRIPTION: Composite: Places a blue line segment connecting (481, 113) to (139, 117) then Places a black dot at position (393, 190) then Renders a magenta box of size 45x63 starting at (207, 103).
; PLAN: r0=481(x1), r1=113(y1), r2=139(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=190(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=207(x), r11=103(y), r12=45(width), r13=63(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 113
LDI r2, 139
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 190
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 207
LDI r11, 103
LDI r12, 45
LDI r13, 63
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
