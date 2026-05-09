; DESCRIPTION: Places a purple 60x33 rectangle at position (424, 222).
; PLAN: r0=424(x), r1=222(y), r2=60(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 222
LDI r2, 60
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
