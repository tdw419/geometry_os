; DESCRIPTION: Creates a black rectangular region at (231, 219) spanning 99 by 28 pixels.
; PLAN: r0=231(x), r1=219(y), r2=99(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 219
LDI r2, 99
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
