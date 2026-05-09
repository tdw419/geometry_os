; DESCRIPTION: Places a orange 33x70 rectangle at position (196, 9).
; PLAN: r0=196(x), r1=9(y), r2=33(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 9
LDI r2, 33
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
