; DESCRIPTION: Renders a orange box of size 28x63 starting at (366, 18).
; PLAN: r0=366(x), r1=18(y), r2=28(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 18
LDI r2, 28
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
