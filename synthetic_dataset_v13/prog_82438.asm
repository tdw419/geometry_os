; DESCRIPTION: Composite: Renders a magenta box of size 10x97 starting at (258, 138) then Sets a single orange pixel at (215, 209) then Draws a blue line from (386, 180) to (332, 76).
; PLAN: r0=258(x), r1=138(y), r2=10(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=209(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=386(x1), r11=180(y1), r12=332(x2), r13=76(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 138
LDI r2, 10
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 209
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 386
LDI r11, 180
LDI r12, 332
LDI r13, 76
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
