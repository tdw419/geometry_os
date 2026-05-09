; DESCRIPTION: Renders a orange box of size 61x65 starting at (252, 118).
; PLAN: r0=252(x), r1=118(y), r2=61(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 118
LDI r2, 61
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
