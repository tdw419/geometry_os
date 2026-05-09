; DESCRIPTION: Places a purple 98x74 rectangle at position (293, 90).
; PLAN: r0=293(x), r1=90(y), r2=98(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 90
LDI r2, 98
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
