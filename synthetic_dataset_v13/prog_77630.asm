; DESCRIPTION: Places a magenta 51x61 rectangle at position (371, 132).
; PLAN: r0=371(x), r1=132(y), r2=51(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 132
LDI r2, 51
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
