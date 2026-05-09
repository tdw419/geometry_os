; DESCRIPTION: Places a blue 90x19 rectangle at position (52, 106).
; PLAN: r0=52(x), r1=106(y), r2=90(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 106
LDI r2, 90
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
