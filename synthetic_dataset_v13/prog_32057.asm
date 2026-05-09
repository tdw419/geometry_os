; DESCRIPTION: Places a purple 35x71 rectangle at position (319, 0).
; PLAN: r0=319(x), r1=0(y), r2=35(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 0
LDI r2, 35
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
