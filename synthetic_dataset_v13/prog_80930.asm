; DESCRIPTION: Places a orange 119x10 rectangle at position (166, 178).
; PLAN: r0=166(x), r1=178(y), r2=119(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 178
LDI r2, 119
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
