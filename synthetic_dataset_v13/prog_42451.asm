; DESCRIPTION: Places a purple 39x73 rectangle at position (117, 132).
; PLAN: r0=117(x), r1=132(y), r2=39(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 132
LDI r2, 39
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
