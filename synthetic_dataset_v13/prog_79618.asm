; DESCRIPTION: Places a blue 93x11 rectangle at position (103, 123).
; PLAN: r0=103(x), r1=123(y), r2=93(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 123
LDI r2, 93
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
