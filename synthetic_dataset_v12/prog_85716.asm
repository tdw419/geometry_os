; DESCRIPTION: Renders a orange box of size 85x95 starting at (366, 0).
; PLAN: r0=366(x), r1=0(y), r2=85(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 0
LDI r2, 85
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
