; DESCRIPTION: Places a purple 92x68 rectangle at position (321, 15).
; PLAN: r0=321(x), r1=15(y), r2=92(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 15
LDI r2, 92
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
