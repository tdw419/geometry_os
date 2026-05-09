; DESCRIPTION: Places a orange 76x21 rectangle at position (336, 5).
; PLAN: r0=336(x), r1=5(y), r2=76(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 5
LDI r2, 76
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
