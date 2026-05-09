; DESCRIPTION: Places a blue 93x10 rectangle at position (323, 135).
; PLAN: r0=323(x), r1=135(y), r2=93(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 135
LDI r2, 93
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
