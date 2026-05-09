; DESCRIPTION: Places a blue 30x96 rectangle at position (170, 83).
; PLAN: r0=170(x), r1=83(y), r2=30(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 83
LDI r2, 30
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
