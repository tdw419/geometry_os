; DESCRIPTION: Composite: Renders a black box of size 56x23 starting at (195, 38) then Sets a single yellow pixel at (246, 70) then Renders a orange line between points (113, 72) and (50, 82).
; PLAN: r0=195(x), r1=38(y), r2=56(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=70(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=113(x1), r11=72(y1), r12=50(x2), r13=82(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 38
LDI r2, 56
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 70
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 113
LDI r11, 72
LDI r12, 50
LDI r13, 82
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
