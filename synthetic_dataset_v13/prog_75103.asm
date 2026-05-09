; DESCRIPTION: Places a orange 118x51 rectangle at position (136, 124).
; PLAN: r0=136(x), r1=124(y), r2=118(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 124
LDI r2, 118
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
