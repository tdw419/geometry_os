; DESCRIPTION: Places a orange 49x40 rectangle at position (258, 51).
; PLAN: r0=258(x), r1=51(y), r2=49(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 51
LDI r2, 49
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
