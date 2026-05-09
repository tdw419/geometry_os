; DESCRIPTION: Places a blue 93x52 rectangle at position (4, 3).
; PLAN: r0=4(x), r1=3(y), r2=93(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 3
LDI r2, 93
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
