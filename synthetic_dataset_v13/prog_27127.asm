; DESCRIPTION: Renders a orange box of size 120x118 starting at (352, 71).
; PLAN: r0=352(x), r1=71(y), r2=120(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 71
LDI r2, 120
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
