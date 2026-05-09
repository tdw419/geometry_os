; DESCRIPTION: Composite: Renders a green box of size 55x41 starting at (296, 170) then Sets a single yellow pixel at (15, 212) then Renders a blue line between points (41, 195) and (215, 55).
; PLAN: r0=296(x), r1=170(y), r2=55(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x), r6=212(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=41(x1), r11=195(y1), r12=215(x2), r13=55(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 170
LDI r2, 55
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 212
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 41
LDI r11, 195
LDI r12, 215
LDI r13, 55
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
