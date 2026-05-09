; DESCRIPTION: Places a purple 112x83 rectangle at position (83, 152).
; PLAN: r0=83(x), r1=152(y), r2=112(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 152
LDI r2, 112
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
