; DESCRIPTION: Places a orange 28x110 rectangle at position (272, 19).
; PLAN: r0=272(x), r1=19(y), r2=28(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 19
LDI r2, 28
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
