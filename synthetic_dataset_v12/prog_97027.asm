; DESCRIPTION: Places a orange 47x72 rectangle at position (439, 119).
; PLAN: r0=439(x), r1=119(y), r2=47(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 119
LDI r2, 47
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
