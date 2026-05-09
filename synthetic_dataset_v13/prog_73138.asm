; DESCRIPTION: Renders a orange box of size 79x22 starting at (375, 218).
; PLAN: r0=375(x), r1=218(y), r2=79(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 218
LDI r2, 79
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
