; DESCRIPTION: Places a purple 16x106 rectangle at position (32, 46).
; PLAN: r0=32(x), r1=46(y), r2=16(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 46
LDI r2, 16
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
