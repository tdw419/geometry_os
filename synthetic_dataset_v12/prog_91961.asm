; DESCRIPTION: Places a purple 91x83 rectangle at position (108, 8).
; PLAN: r0=108(x), r1=8(y), r2=91(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 8
LDI r2, 91
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
