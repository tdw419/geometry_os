; DESCRIPTION: Places a orange 51x106 rectangle at position (106, 17).
; PLAN: r0=106(x), r1=17(y), r2=51(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 17
LDI r2, 51
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
