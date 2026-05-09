; DESCRIPTION: Places a purple 39x13 rectangle at position (371, 194).
; PLAN: r0=371(x), r1=194(y), r2=39(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 194
LDI r2, 39
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
