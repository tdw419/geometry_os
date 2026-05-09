; DESCRIPTION: Renders a green box of size 41x104 starting at (451, 57).
; PLAN: r0=451(x), r1=57(y), r2=41(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 57
LDI r2, 41
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
