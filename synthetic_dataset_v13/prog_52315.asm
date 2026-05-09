; DESCRIPTION: Creates a black rectangular region at (93, 217) spanning 120 by 30 pixels.
; PLAN: r0=93(x), r1=217(y), r2=120(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 217
LDI r2, 120
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
