; DESCRIPTION: Renders a orange box of size 22x79 starting at (26, 33).
; PLAN: r0=26(x), r1=33(y), r2=22(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 33
LDI r2, 22
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
