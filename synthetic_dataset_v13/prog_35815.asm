; DESCRIPTION: Places a red 114x51 rectangle at position (161, 163).
; PLAN: r0=161(x), r1=163(y), r2=114(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 163
LDI r2, 114
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
