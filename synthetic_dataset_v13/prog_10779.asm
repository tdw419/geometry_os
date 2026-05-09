; DESCRIPTION: Renders a red box of size 56x15 starting at (455, 115).
; PLAN: r0=455(x), r1=115(y), r2=56(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 115
LDI r2, 56
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
