; DESCRIPTION: Places a purple 109x88 rectangle at position (273, 130).
; PLAN: r0=273(x), r1=130(y), r2=109(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 130
LDI r2, 109
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
