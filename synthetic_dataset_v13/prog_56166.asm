; DESCRIPTION: Composite: Creates a purple circular shape at (374, 119) with radius 22 then Renders a red box of size 84x89 starting at (151, 60) then Draws a cyan line from (511, 236) to (2, 153).
; PLAN: r0=374(x), r1=119(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=60(y), r7=84(width), r8=89(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=511(x1), r11=236(y1), r12=2(x2), r13=153(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 119
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 60
LDI r7, 84
LDI r8, 89
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 511
LDI r11, 236
LDI r12, 2
LDI r13, 153
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
