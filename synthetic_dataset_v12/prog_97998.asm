; DESCRIPTION: Creates a white rectangular region at (393, 123) spanning 63 by 97 pixels.
; PLAN: r0=393(x), r1=123(y), r2=63(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 123
LDI r2, 63
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
