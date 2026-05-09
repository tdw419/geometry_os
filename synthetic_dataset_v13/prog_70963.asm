; DESCRIPTION: Places a blue 81x118 rectangle at position (367, 37).
; PLAN: r0=367(x), r1=37(y), r2=81(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 37
LDI r2, 81
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
