; DESCRIPTION: Creates a green rectangular region at (234, 122) spanning 63 by 87 pixels.
; PLAN: r0=234(x), r1=122(y), r2=63(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 122
LDI r2, 63
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
