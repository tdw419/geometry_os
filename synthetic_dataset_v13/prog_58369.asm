; DESCRIPTION: Renders a orange box of size 89x115 starting at (6, 132).
; PLAN: r0=6(x), r1=132(y), r2=89(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 132
LDI r2, 89
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
