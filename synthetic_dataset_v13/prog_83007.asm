; DESCRIPTION: Places a purple 92x87 rectangle at position (178, 140).
; PLAN: r0=178(x), r1=140(y), r2=92(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 140
LDI r2, 92
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
