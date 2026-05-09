; DESCRIPTION: Renders a orange box of size 41x14 starting at (128, 145).
; PLAN: r0=128(x), r1=145(y), r2=41(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 145
LDI r2, 41
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
