; DESCRIPTION: Places a purple 92x92 rectangle at position (171, 163).
; PLAN: r0=171(x), r1=163(y), r2=92(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 163
LDI r2, 92
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
