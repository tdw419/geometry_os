; DESCRIPTION: Places a purple 100x19 rectangle at position (164, 202).
; PLAN: r0=164(x), r1=202(y), r2=100(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 202
LDI r2, 100
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
