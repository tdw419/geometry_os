; DESCRIPTION: Places a purple 103x15 rectangle at position (142, 160).
; PLAN: r0=142(x), r1=160(y), r2=103(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 160
LDI r2, 103
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
