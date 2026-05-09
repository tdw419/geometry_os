; DESCRIPTION: Places a purple 92x72 rectangle at position (372, 147).
; PLAN: r0=372(x), r1=147(y), r2=92(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 147
LDI r2, 92
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
