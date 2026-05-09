; DESCRIPTION: Places a purple 13x26 rectangle at position (65, 49).
; PLAN: r0=65(x), r1=49(y), r2=13(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 49
LDI r2, 13
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
