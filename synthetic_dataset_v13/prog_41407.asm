; DESCRIPTION: Places a orange 37x105 rectangle at position (90, 84).
; PLAN: r0=90(x), r1=84(y), r2=37(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 84
LDI r2, 37
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
