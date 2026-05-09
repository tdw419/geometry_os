; DESCRIPTION: Places a orange 35x21 rectangle at position (66, 207).
; PLAN: r0=66(x), r1=207(y), r2=35(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 207
LDI r2, 35
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
