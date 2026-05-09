; DESCRIPTION: Renders a orange box of size 15x118 starting at (260, 82).
; PLAN: r0=260(x), r1=82(y), r2=15(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 82
LDI r2, 15
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
