; DESCRIPTION: Places a purple 84x112 rectangle at position (345, 59).
; PLAN: r0=345(x), r1=59(y), r2=84(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 59
LDI r2, 84
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
