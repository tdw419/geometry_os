; DESCRIPTION: Places a blue 52x58 rectangle at position (206, 93).
; PLAN: r0=206(x), r1=93(y), r2=52(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 93
LDI r2, 52
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
