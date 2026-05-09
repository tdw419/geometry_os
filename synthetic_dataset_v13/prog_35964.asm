; DESCRIPTION: Places a green 105x115 rectangle at position (132, 136).
; PLAN: r0=132(x), r1=136(y), r2=105(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 136
LDI r2, 105
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
