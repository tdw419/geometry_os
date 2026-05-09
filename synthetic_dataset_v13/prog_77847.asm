; DESCRIPTION: Places a black 85x51 rectangle at position (236, 180).
; PLAN: r0=236(x), r1=180(y), r2=85(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 180
LDI r2, 85
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
