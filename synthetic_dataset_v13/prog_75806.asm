; DESCRIPTION: Places a purple 111x13 rectangle at position (338, 132).
; PLAN: r0=338(x), r1=132(y), r2=111(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 132
LDI r2, 111
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
