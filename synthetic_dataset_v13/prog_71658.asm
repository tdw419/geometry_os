; DESCRIPTION: Places a orange 56x34 rectangle at position (111, 148).
; PLAN: r0=111(x), r1=148(y), r2=56(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 148
LDI r2, 56
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
