; DESCRIPTION: Composite: Renders a red box of size 32x50 starting at (232, 123) then Renders a magenta line between points (360, 54) and (0, 43) then Sets a single red pixel at (43, 153).
; PLAN: r0=232(x), r1=123(y), r2=32(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x1), r6=54(y1), r7=0(x2), r8=43(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=43(x), r11=153(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 123
LDI r2, 32
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 54
LDI r7, 0
LDI r8, 43
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 153
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
