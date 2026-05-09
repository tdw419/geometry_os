; DESCRIPTION: Places a red 43x51 rectangle at position (423, 66).
; PLAN: r0=423(x), r1=66(y), r2=43(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 66
LDI r2, 43
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
