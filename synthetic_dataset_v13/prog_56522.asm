; DESCRIPTION: Places a blue 73x81 rectangle at position (350, 162).
; PLAN: r0=350(x), r1=162(y), r2=73(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 162
LDI r2, 73
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
