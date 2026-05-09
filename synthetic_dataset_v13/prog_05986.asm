; DESCRIPTION: Creates a blue rectangular region at (128, 243) spanning 41 by 13 pixels.
; PLAN: r0=128(x), r1=243(y), r2=41(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 243
LDI r2, 41
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
