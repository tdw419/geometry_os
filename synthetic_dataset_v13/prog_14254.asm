; DESCRIPTION: Renders a orange box of size 106x63 starting at (123, 136).
; PLAN: r0=123(x), r1=136(y), r2=106(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 136
LDI r2, 106
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
