; DESCRIPTION: Composite: Renders a red box of size 27x85 starting at (245, 1) then Sets a single cyan pixel at (476, 66) then Places a purple line segment connecting (462, 75) to (72, 232).
; PLAN: r0=245(x), r1=1(y), r2=27(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x), r6=66(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=462(x1), r11=75(y1), r12=72(x2), r13=232(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 1
LDI r2, 27
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 66
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 462
LDI r11, 75
LDI r12, 72
LDI r13, 232
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
