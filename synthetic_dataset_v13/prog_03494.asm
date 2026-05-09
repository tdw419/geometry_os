; DESCRIPTION: Places a green 118x93 rectangle at position (127, 87).
; PLAN: r0=127(x), r1=87(y), r2=118(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 87
LDI r2, 118
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
