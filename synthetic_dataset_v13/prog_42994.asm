; DESCRIPTION: Places a purple 98x61 rectangle at position (159, 49).
; PLAN: r0=159(x), r1=49(y), r2=98(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 49
LDI r2, 98
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
