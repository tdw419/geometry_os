; DESCRIPTION: Places a purple 107x33 rectangle at position (352, 101).
; PLAN: r0=352(x), r1=101(y), r2=107(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 101
LDI r2, 107
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
