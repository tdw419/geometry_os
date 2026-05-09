; DESCRIPTION: Creates a yellow rectangular region at (309, 128) spanning 96 by 34 pixels.
; PLAN: r0=309(x), r1=128(y), r2=96(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 128
LDI r2, 96
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
