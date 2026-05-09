; DESCRIPTION: Places a green 66x51 rectangle at position (338, 115).
; PLAN: r0=338(x), r1=115(y), r2=66(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 115
LDI r2, 66
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
