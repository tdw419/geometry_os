; DESCRIPTION: Places a blue 93x106 rectangle at position (15, 52).
; PLAN: r0=15(x), r1=52(y), r2=93(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 52
LDI r2, 93
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
