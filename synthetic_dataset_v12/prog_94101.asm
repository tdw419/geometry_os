; DESCRIPTION: Places a green 86x105 rectangle at position (133, 58).
; PLAN: r0=133(x), r1=58(y), r2=86(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 58
LDI r2, 86
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
