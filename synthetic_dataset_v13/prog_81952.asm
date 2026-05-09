; DESCRIPTION: Places a purple 17x42 rectangle at position (282, 175).
; PLAN: r0=282(x), r1=175(y), r2=17(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 175
LDI r2, 17
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
