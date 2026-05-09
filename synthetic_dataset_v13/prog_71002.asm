; DESCRIPTION: Renders a orange box of size 56x17 starting at (105, 120).
; PLAN: r0=105(x), r1=120(y), r2=56(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 120
LDI r2, 56
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
