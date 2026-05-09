; DESCRIPTION: Places a yellow 113x51 rectangle at position (286, 115).
; PLAN: r0=286(x), r1=115(y), r2=113(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 115
LDI r2, 113
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
