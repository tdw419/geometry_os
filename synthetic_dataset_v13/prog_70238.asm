; DESCRIPTION: Renders a orange box of size 113x54 starting at (110, 84).
; PLAN: r0=110(x), r1=84(y), r2=113(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 84
LDI r2, 113
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
