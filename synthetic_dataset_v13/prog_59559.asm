; DESCRIPTION: Renders a orange box of size 86x115 starting at (161, 87).
; PLAN: r0=161(x), r1=87(y), r2=86(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 87
LDI r2, 86
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
