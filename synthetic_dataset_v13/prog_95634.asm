; DESCRIPTION: Places a purple 25x85 rectangle at position (221, 140).
; PLAN: r0=221(x), r1=140(y), r2=25(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 140
LDI r2, 25
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
