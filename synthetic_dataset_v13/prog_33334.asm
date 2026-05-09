; DESCRIPTION: Creates a black rectangular region at (363, 128) spanning 74 by 81 pixels.
; PLAN: r0=363(x), r1=128(y), r2=74(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 128
LDI r2, 74
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
