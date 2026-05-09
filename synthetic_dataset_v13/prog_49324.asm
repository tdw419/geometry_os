; DESCRIPTION: Composite: Renders a magenta box of size 24x113 starting at (438, 73) then Sets a single purple pixel at (266, 102) then Draws a magenta line from (479, 226) to (55, 56).
; PLAN: r0=438(x), r1=73(y), r2=24(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=479(x1), r11=226(y1), r12=55(x2), r13=56(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 73
LDI r2, 24
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 479
LDI r11, 226
LDI r12, 55
LDI r13, 56
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
