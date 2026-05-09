; DESCRIPTION: Creates a black rectangular region at (383, 90) spanning 120 by 97 pixels.
; PLAN: r0=383(x), r1=90(y), r2=120(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 90
LDI r2, 120
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
