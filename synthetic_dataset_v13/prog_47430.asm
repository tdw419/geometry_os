; DESCRIPTION: Composite: Places a magenta line segment connecting (365, 234) to (150, 5) then Sets a single purple pixel at (39, 73) then Draws a purple rectangle at (481, 208) with width 31 and height 45.
; PLAN: r0=365(x1), r1=234(y1), r2=150(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=73(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=481(x), r11=208(y), r12=31(width), r13=45(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 234
LDI r2, 150
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 73
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 481
LDI r11, 208
LDI r12, 31
LDI r13, 45
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
