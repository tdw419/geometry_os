; DESCRIPTION: Renders a orange box of size 84x101 starting at (365, 16).
; PLAN: r0=365(x), r1=16(y), r2=84(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 16
LDI r2, 84
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
