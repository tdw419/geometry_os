; DESCRIPTION: Places a orange 41x21 rectangle at position (402, 30).
; PLAN: r0=402(x), r1=30(y), r2=41(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 30
LDI r2, 41
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
