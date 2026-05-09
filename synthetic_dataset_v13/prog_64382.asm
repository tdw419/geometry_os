; DESCRIPTION: Places a purple 114x18 rectangle at position (337, 221).
; PLAN: r0=337(x), r1=221(y), r2=114(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 221
LDI r2, 114
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
