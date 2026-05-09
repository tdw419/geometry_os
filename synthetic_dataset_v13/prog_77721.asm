; DESCRIPTION: Renders a orange box of size 38x44 starting at (52, 87).
; PLAN: r0=52(x), r1=87(y), r2=38(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 87
LDI r2, 38
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
