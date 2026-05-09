; DESCRIPTION: Places a purple 103x64 rectangle at position (337, 105).
; PLAN: r0=337(x), r1=105(y), r2=103(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 105
LDI r2, 103
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
