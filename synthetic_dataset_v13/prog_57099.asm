; DESCRIPTION: Renders a orange box of size 43x79 starting at (63, 34).
; PLAN: r0=63(x), r1=34(y), r2=43(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 34
LDI r2, 43
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
