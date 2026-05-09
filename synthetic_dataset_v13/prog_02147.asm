; DESCRIPTION: Creates a yellow rectangular region at (309, 11) spanning 63 by 21 pixels.
; PLAN: r0=309(x), r1=11(y), r2=63(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 11
LDI r2, 63
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
