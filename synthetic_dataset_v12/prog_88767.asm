; DESCRIPTION: Composite: Renders a magenta box of size 60x40 starting at (260, 197) then Sets a single yellow pixel at (71, 244) then Places a red line segment connecting (488, 164) to (340, 89).
; PLAN: r0=260(x), r1=197(y), r2=60(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=244(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=488(x1), r11=164(y1), r12=340(x2), r13=89(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 197
LDI r2, 60
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 244
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 488
LDI r11, 164
LDI r12, 340
LDI r13, 89
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
