; DESCRIPTION: Places a green 86x44 rectangle at position (249, 105).
; PLAN: r0=249(x), r1=105(y), r2=86(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 105
LDI r2, 86
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
