; DESCRIPTION: Places a yellow 96x49 rectangle at position (51, 179).
; PLAN: r0=51(x), r1=179(y), r2=96(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 179
LDI r2, 96
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
