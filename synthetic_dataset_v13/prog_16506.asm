; DESCRIPTION: Composite: Renders a purple line between points (479, 90) and (95, 125) then Renders a red box of size 92x84 starting at (316, 135) then Sets a single yellow pixel at (173, 190).
; PLAN: r0=479(x1), r1=90(y1), r2=95(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=135(y), r7=92(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=190(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 479
LDI r1, 90
LDI r2, 95
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 135
LDI r7, 92
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 190
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
