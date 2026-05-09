; DESCRIPTION: Renders a orange box of size 60x66 starting at (232, 14).
; PLAN: r0=232(x), r1=14(y), r2=60(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 14
LDI r2, 60
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
