; DESCRIPTION: Places a purple 111x106 rectangle at position (209, 19).
; PLAN: r0=209(x), r1=19(y), r2=111(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 19
LDI r2, 111
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
