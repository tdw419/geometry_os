; DESCRIPTION: Places a orange 91x52 rectangle at position (170, 133).
; PLAN: r0=170(x), r1=133(y), r2=91(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 133
LDI r2, 91
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
