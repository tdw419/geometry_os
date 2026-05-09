; DESCRIPTION: Places a yellow 43x119 rectangle at position (123, 123).
; PLAN: r0=123(x), r1=123(y), r2=43(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 123
LDI r2, 43
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
