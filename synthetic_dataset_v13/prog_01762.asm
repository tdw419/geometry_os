; DESCRIPTION: Places a orange 75x95 rectangle at position (286, 145).
; PLAN: r0=286(x), r1=145(y), r2=75(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 145
LDI r2, 75
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
