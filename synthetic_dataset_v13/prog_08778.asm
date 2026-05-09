; DESCRIPTION: Renders a orange box of size 41x106 starting at (296, 79).
; PLAN: r0=296(x), r1=79(y), r2=41(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 79
LDI r2, 41
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
