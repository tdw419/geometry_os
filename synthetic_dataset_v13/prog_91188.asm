; DESCRIPTION: Places a yellow 95x51 rectangle at position (18, 43).
; PLAN: r0=18(x), r1=43(y), r2=95(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 43
LDI r2, 95
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
