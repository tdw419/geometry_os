; DESCRIPTION: Creates a black rectangular region at (93, 172) spanning 117 by 12 pixels.
; PLAN: r0=93(x), r1=172(y), r2=117(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 172
LDI r2, 117
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
