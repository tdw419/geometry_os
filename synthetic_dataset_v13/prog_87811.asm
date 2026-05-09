; DESCRIPTION: Places a orange 74x63 rectangle at position (402, 29).
; PLAN: r0=402(x), r1=29(y), r2=74(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 29
LDI r2, 74
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
