; DESCRIPTION: Places a purple 49x109 rectangle at position (2, 130).
; PLAN: r0=2(x), r1=130(y), r2=49(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 130
LDI r2, 49
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
