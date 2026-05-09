; DESCRIPTION: Places a purple 24x43 rectangle at position (103, 39).
; PLAN: r0=103(x), r1=39(y), r2=24(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 39
LDI r2, 24
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
