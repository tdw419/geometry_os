; DESCRIPTION: Renders a orange box of size 109x118 starting at (177, 57).
; PLAN: r0=177(x), r1=57(y), r2=109(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 57
LDI r2, 109
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
