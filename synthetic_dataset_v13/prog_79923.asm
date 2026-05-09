; DESCRIPTION: Places a purple 101x36 rectangle at position (130, 9).
; PLAN: r0=130(x), r1=9(y), r2=101(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 9
LDI r2, 101
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
