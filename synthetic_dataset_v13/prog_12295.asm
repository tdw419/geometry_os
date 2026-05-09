; DESCRIPTION: Renders a orange box of size 41x100 starting at (290, 93).
; PLAN: r0=290(x), r1=93(y), r2=41(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 93
LDI r2, 41
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
