; DESCRIPTION: Places a purple 86x102 rectangle at position (337, 23).
; PLAN: r0=337(x), r1=23(y), r2=86(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 23
LDI r2, 86
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
