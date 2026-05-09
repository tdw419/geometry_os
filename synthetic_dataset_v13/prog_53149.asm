; DESCRIPTION: Creates a black rectangular region at (439, 74) spanning 37 by 118 pixels.
; PLAN: r0=439(x), r1=74(y), r2=37(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 74
LDI r2, 37
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
