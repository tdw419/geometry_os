; DESCRIPTION: Places a red 115x26 rectangle at position (145, 119).
; PLAN: r0=145(x), r1=119(y), r2=115(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 119
LDI r2, 115
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
