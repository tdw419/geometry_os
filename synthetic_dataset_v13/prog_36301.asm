; DESCRIPTION: Places a orange 25x114 rectangle at position (189, 51).
; PLAN: r0=189(x), r1=51(y), r2=25(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 51
LDI r2, 25
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
