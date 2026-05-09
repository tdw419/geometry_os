; DESCRIPTION: Places a red 110x115 rectangle at position (170, 119).
; PLAN: r0=170(x), r1=119(y), r2=110(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 119
LDI r2, 110
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
