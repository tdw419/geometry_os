; DESCRIPTION: Creates a cyan rectangular region at (253, 132) spanning 62 by 11 pixels.
; PLAN: r0=253(x), r1=132(y), r2=62(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 132
LDI r2, 62
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
