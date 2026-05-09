; DESCRIPTION: Creates a white rectangular region at (149, 211) spanning 63 by 23 pixels.
; PLAN: r0=149(x), r1=211(y), r2=63(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 211
LDI r2, 63
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
