; DESCRIPTION: Places a purple 39x119 rectangle at position (297, 104).
; PLAN: r0=297(x), r1=104(y), r2=39(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 104
LDI r2, 39
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
