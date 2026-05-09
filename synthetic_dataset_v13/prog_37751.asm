; DESCRIPTION: Renders a orange box of size 31x51 starting at (448, 118).
; PLAN: r0=448(x), r1=118(y), r2=31(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 118
LDI r2, 31
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
