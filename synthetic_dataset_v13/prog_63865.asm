; DESCRIPTION: Composite: Renders a magenta box of size 27x88 starting at (366, 52) then Sets a single red pixel at (62, 213) then Renders a cyan line between points (82, 135) and (20, 160).
; PLAN: r0=366(x), r1=52(y), r2=27(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=213(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=82(x1), r11=135(y1), r12=20(x2), r13=160(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 52
LDI r2, 27
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 213
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 82
LDI r11, 135
LDI r12, 20
LDI r13, 160
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
