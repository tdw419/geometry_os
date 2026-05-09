; DESCRIPTION: Places a purple 80x13 rectangle at position (380, 81).
; PLAN: r0=380(x), r1=81(y), r2=80(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 81
LDI r2, 80
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
