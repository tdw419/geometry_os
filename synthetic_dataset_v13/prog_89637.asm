; DESCRIPTION: Renders a orange box of size 25x118 starting at (346, 89).
; PLAN: r0=346(x), r1=89(y), r2=25(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 89
LDI r2, 25
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
