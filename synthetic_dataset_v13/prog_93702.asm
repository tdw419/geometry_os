; DESCRIPTION: Renders a orange box of size 77x45 starting at (6, 45).
; PLAN: r0=6(x), r1=45(y), r2=77(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 45
LDI r2, 77
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
