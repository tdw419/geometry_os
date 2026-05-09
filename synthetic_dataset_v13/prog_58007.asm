; DESCRIPTION: Places a purple 104x113 rectangle at position (376, 92).
; PLAN: r0=376(x), r1=92(y), r2=104(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 92
LDI r2, 104
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
