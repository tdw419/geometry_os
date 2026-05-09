; DESCRIPTION: Renders a orange box of size 15x45 starting at (153, 76).
; PLAN: r0=153(x), r1=76(y), r2=15(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 76
LDI r2, 15
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
