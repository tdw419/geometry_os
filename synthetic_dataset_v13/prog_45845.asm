; DESCRIPTION: Places a orange 13x119 rectangle at position (439, 75).
; PLAN: r0=439(x), r1=75(y), r2=13(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 75
LDI r2, 13
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
