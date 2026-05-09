; DESCRIPTION: Creates a black rectangular region at (231, 37) spanning 89 by 27 pixels.
; PLAN: r0=231(x), r1=37(y), r2=89(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 37
LDI r2, 89
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
