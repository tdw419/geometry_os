; DESCRIPTION: Creates a black rectangular region at (269, 172) spanning 15 by 74 pixels.
; PLAN: r0=269(x), r1=172(y), r2=15(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 172
LDI r2, 15
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
