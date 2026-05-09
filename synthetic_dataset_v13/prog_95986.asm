; DESCRIPTION: Places a blue 79x104 rectangle at position (145, 28).
; PLAN: r0=145(x), r1=28(y), r2=79(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 28
LDI r2, 79
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
