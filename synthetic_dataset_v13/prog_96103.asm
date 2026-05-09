; DESCRIPTION: Places a purple 31x29 rectangle at position (337, 166).
; PLAN: r0=337(x), r1=166(y), r2=31(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 166
LDI r2, 31
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
