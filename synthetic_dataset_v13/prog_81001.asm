; DESCRIPTION: Renders a orange box of size 86x83 starting at (368, 41).
; PLAN: r0=368(x), r1=41(y), r2=86(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 41
LDI r2, 86
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
