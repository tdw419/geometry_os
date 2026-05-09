; DESCRIPTION: Places a purple 107x69 rectangle at position (297, 17).
; PLAN: r0=297(x), r1=17(y), r2=107(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 17
LDI r2, 107
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
