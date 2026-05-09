; DESCRIPTION: Places a purple 13x43 rectangle at position (352, 64).
; PLAN: r0=352(x), r1=64(y), r2=13(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 64
LDI r2, 13
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
