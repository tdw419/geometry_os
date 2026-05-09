; DESCRIPTION: Places a purple 39x19 rectangle at position (217, 100).
; PLAN: r0=217(x), r1=100(y), r2=39(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 100
LDI r2, 39
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
