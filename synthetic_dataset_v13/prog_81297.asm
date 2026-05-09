; DESCRIPTION: Places a purple 33x56 rectangle at position (326, 75).
; PLAN: r0=326(x), r1=75(y), r2=33(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 75
LDI r2, 33
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
