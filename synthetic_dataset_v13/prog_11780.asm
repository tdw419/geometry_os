; DESCRIPTION: Renders a orange box of size 105x66 starting at (54, 45).
; PLAN: r0=54(x), r1=45(y), r2=105(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 45
LDI r2, 105
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
