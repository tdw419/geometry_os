; DESCRIPTION: Renders a orange box of size 41x79 starting at (49, 169).
; PLAN: r0=49(x), r1=169(y), r2=41(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 169
LDI r2, 41
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
