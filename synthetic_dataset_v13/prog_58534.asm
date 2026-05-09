; DESCRIPTION: Places a green 84x51 rectangle at position (221, 191).
; PLAN: r0=221(x), r1=191(y), r2=84(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 191
LDI r2, 84
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
