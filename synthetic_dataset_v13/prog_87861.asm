; DESCRIPTION: Places a purple 36x119 rectangle at position (17, 59).
; PLAN: r0=17(x), r1=59(y), r2=36(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 59
LDI r2, 36
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
