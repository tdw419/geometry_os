; DESCRIPTION: Places a green 25x33 rectangle at position (181, 145).
; PLAN: r0=181(x), r1=145(y), r2=25(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 145
LDI r2, 25
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
