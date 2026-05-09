; DESCRIPTION: Places a purple 51x117 rectangle at position (167, 15).
; PLAN: r0=167(x), r1=15(y), r2=51(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 15
LDI r2, 51
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
