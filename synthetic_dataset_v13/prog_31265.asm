; DESCRIPTION: Places a blue 51x79 rectangle at position (383, 172).
; PLAN: r0=383(x), r1=172(y), r2=51(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 172
LDI r2, 51
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
