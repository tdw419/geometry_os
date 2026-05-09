; DESCRIPTION: Places a green 38x118 rectangle at position (411, 115).
; PLAN: r0=411(x), r1=115(y), r2=38(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 115
LDI r2, 38
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
