; DESCRIPTION: Places a purple 35x65 rectangle at position (226, 85).
; PLAN: r0=226(x), r1=85(y), r2=35(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 85
LDI r2, 35
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
