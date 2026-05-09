; DESCRIPTION: Places a purple 73x36 rectangle at position (289, 14).
; PLAN: r0=289(x), r1=14(y), r2=73(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 14
LDI r2, 73
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
