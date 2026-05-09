; DESCRIPTION: Places a orange 51x82 rectangle at position (359, 1).
; PLAN: r0=359(x), r1=1(y), r2=51(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 1
LDI r2, 51
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
