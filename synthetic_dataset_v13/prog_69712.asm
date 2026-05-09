; DESCRIPTION: Places a black 75x51 rectangle at position (113, 79).
; PLAN: r0=113(x), r1=79(y), r2=75(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 79
LDI r2, 75
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
