; DESCRIPTION: Renders a orange box of size 30x118 starting at (446, 84).
; PLAN: r0=446(x), r1=84(y), r2=30(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 84
LDI r2, 30
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
