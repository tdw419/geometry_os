; DESCRIPTION: Places a purple 73x90 rectangle at position (258, 103).
; PLAN: r0=258(x), r1=103(y), r2=73(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 103
LDI r2, 73
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
