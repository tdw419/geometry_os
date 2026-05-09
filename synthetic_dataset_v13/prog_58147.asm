; DESCRIPTION: Places a purple 39x72 rectangle at position (313, 99).
; PLAN: r0=313(x), r1=99(y), r2=39(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 99
LDI r2, 39
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
