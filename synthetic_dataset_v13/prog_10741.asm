; DESCRIPTION: Places a orange 30x119 rectangle at position (440, 109).
; PLAN: r0=440(x), r1=109(y), r2=30(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 109
LDI r2, 30
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
