; DESCRIPTION: Creates a black rectangular region at (158, 23) spanning 16 by 97 pixels.
; PLAN: r0=158(x), r1=23(y), r2=16(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 23
LDI r2, 16
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
