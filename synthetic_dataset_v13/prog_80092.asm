; DESCRIPTION: Composite: Creates a black rectangular region at (307, 41) spanning 79 by 116 pixels then Renders a yellow disk with center (77, 61) and radius 10.
; PLAN: r0=307(x), r1=41(y), r2=79(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=61(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 41
LDI r2, 79
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 61
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
