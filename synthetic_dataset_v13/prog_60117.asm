; DESCRIPTION: Composite: Renders a red box of size 110x12 starting at (357, 83) then Sets a single magenta pixel at (95, 108) then Renders a purple disk with center (121, 146) and radius 78.
; PLAN: r0=357(x), r1=83(y), r2=110(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=108(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=146(y), r12=78(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 83
LDI r2, 110
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 108
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 121
LDI r11, 146
LDI r12, 78
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
