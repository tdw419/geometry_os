; DESCRIPTION: Places a purple 60x77 rectangle at position (72, 92).
; PLAN: r0=72(x), r1=92(y), r2=60(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 92
LDI r2, 60
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
