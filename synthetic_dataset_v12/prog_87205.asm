; DESCRIPTION: Places a orange 19x111 rectangle at position (399, 23).
; PLAN: r0=399(x), r1=23(y), r2=19(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 23
LDI r2, 19
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
