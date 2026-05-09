; DESCRIPTION: Creates a blue rectangular region at (41, 211) spanning 63 by 27 pixels.
; PLAN: r0=41(x), r1=211(y), r2=63(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 211
LDI r2, 63
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
