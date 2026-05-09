; DESCRIPTION: Places a red 51x94 rectangle at position (13, 90).
; PLAN: r0=13(x), r1=90(y), r2=51(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 90
LDI r2, 51
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
