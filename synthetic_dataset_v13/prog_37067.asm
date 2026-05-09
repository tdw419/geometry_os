; DESCRIPTION: Places a purple 44x29 rectangle at position (233, 216).
; PLAN: r0=233(x), r1=216(y), r2=44(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 216
LDI r2, 44
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
