; DESCRIPTION: Places a blue 117x94 rectangle at position (250, 57).
; PLAN: r0=250(x), r1=57(y), r2=117(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 57
LDI r2, 117
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
