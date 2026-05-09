; DESCRIPTION: Places a purple 32x39 rectangle at position (216, 46).
; PLAN: r0=216(x), r1=46(y), r2=32(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 46
LDI r2, 32
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
