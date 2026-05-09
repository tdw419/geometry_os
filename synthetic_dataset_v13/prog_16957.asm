; DESCRIPTION: Composite: Draws a blue line from (296, 85) to (292, 250) then Sets a single blue pixel at (66, 79) then Renders a cyan box of size 68x21 starting at (32, 126).
; PLAN: r0=296(x1), r1=85(y1), r2=292(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=79(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=32(x), r11=126(y), r12=68(width), r13=21(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 85
LDI r2, 292
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 79
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 32
LDI r11, 126
LDI r12, 68
LDI r13, 21
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
