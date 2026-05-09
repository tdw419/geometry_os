; DESCRIPTION: Places a purple 111x43 rectangle at position (142, 43).
; PLAN: r0=142(x), r1=43(y), r2=111(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 43
LDI r2, 111
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
