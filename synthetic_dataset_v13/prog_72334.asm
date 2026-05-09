; DESCRIPTION: Places a orange 33x75 rectangle at position (145, 9).
; PLAN: r0=145(x), r1=9(y), r2=33(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 9
LDI r2, 33
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
