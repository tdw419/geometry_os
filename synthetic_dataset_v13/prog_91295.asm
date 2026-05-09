; DESCRIPTION: Places a blue 95x24 rectangle at position (280, 118).
; PLAN: r0=280(x), r1=118(y), r2=95(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 118
LDI r2, 95
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
