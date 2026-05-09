; DESCRIPTION: Creates a black rectangular region at (25, 27) spanning 97 by 87 pixels.
; PLAN: r0=25(x), r1=27(y), r2=97(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 27
LDI r2, 97
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
