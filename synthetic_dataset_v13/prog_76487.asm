; DESCRIPTION: Places a orange 37x105 rectangle at position (211, 135).
; PLAN: r0=211(x), r1=135(y), r2=37(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 135
LDI r2, 37
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
