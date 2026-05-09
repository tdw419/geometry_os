; DESCRIPTION: Composite: Renders a cyan box of size 50x10 starting at (259, 167) then Sets a single yellow pixel at (454, 191) then Places a orange line segment connecting (128, 164) to (113, 135).
; PLAN: r0=259(x), r1=167(y), r2=50(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=191(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=128(x1), r11=164(y1), r12=113(x2), r13=135(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 167
LDI r2, 50
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 191
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 128
LDI r11, 164
LDI r12, 113
LDI r13, 135
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
