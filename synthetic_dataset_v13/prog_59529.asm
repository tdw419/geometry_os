; DESCRIPTION: Places a blue 51x76 rectangle at position (417, 77).
; PLAN: r0=417(x), r1=77(y), r2=51(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 77
LDI r2, 51
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
