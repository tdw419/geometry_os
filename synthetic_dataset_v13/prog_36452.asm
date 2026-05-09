; DESCRIPTION: Places a purple 37x81 rectangle at position (19, 134).
; PLAN: r0=19(x), r1=134(y), r2=37(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 134
LDI r2, 37
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
