; DESCRIPTION: Places a purple 17x82 rectangle at position (271, 3).
; PLAN: r0=271(x), r1=3(y), r2=17(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 3
LDI r2, 17
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
