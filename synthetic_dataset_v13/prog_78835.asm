; DESCRIPTION: Renders a orange box of size 58x31 starting at (123, 115).
; PLAN: r0=123(x), r1=115(y), r2=58(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 115
LDI r2, 58
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
