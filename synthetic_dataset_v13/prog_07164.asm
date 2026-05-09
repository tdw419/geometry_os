; DESCRIPTION: Places a purple 92x56 rectangle at position (4, 166).
; PLAN: r0=4(x), r1=166(y), r2=92(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 166
LDI r2, 92
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
