; DESCRIPTION: Composite: Renders a black box of size 96x116 starting at (122, 83) then Creates a red circular shape at (302, 79) with radius 68.
; PLAN: r0=122(x), r1=83(y), r2=96(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=79(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 83
LDI r2, 96
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 79
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
