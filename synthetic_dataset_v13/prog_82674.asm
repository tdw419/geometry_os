; DESCRIPTION: Places a blue 51x96 rectangle at position (229, 114).
; PLAN: r0=229(x), r1=114(y), r2=51(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 114
LDI r2, 51
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
