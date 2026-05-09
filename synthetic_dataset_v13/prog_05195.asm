; DESCRIPTION: Renders a green box of size 41x96 starting at (271, 63).
; PLAN: r0=271(x), r1=63(y), r2=41(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 63
LDI r2, 41
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
