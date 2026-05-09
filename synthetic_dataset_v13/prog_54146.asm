; DESCRIPTION: Creates a black rectangular region at (44, 179) spanning 35 by 25 pixels.
; PLAN: r0=44(x), r1=179(y), r2=35(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 179
LDI r2, 35
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
