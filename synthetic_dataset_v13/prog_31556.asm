; DESCRIPTION: Composite: Renders a red box of size 52x41 starting at (108, 81) then Sets a single white pixel at (21, 138) then Creates a red circular shape at (288, 127) with radius 72.
; PLAN: r0=108(x), r1=81(y), r2=52(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=138(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=127(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 81
LDI r2, 52
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 138
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 288
LDI r11, 127
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
