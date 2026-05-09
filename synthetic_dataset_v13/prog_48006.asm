; DESCRIPTION: Places a orange 43x25 rectangle at position (399, 69).
; PLAN: r0=399(x), r1=69(y), r2=43(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 69
LDI r2, 43
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
