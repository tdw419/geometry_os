; DESCRIPTION: Places a purple 59x72 rectangle at position (92, 134).
; PLAN: r0=92(x), r1=134(y), r2=59(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 134
LDI r2, 59
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
