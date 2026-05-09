; DESCRIPTION: Creates a white rectangular region at (462, 63) spanning 13 by 78 pixels.
; PLAN: r0=462(x), r1=63(y), r2=13(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 63
LDI r2, 13
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
