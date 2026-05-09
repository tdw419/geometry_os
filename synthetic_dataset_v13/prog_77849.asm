; DESCRIPTION: Places a orange 93x15 rectangle at position (272, 33).
; PLAN: r0=272(x), r1=33(y), r2=93(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 33
LDI r2, 93
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
