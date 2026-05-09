; DESCRIPTION: Places a purple 103x30 rectangle at position (270, 101).
; PLAN: r0=270(x), r1=101(y), r2=103(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 101
LDI r2, 103
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
