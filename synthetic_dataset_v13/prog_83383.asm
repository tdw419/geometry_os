; DESCRIPTION: Places a purple 73x100 rectangle at position (169, 130).
; PLAN: r0=169(x), r1=130(y), r2=73(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 130
LDI r2, 73
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
