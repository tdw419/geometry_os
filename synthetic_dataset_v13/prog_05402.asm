; DESCRIPTION: Places a orange 119x25 rectangle at position (261, 0).
; PLAN: r0=261(x), r1=0(y), r2=119(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 0
LDI r2, 119
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
