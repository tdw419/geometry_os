; DESCRIPTION: Renders a orange box of size 17x54 starting at (123, 133).
; PLAN: r0=123(x), r1=133(y), r2=17(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 133
LDI r2, 17
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
