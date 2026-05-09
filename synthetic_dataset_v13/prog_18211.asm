; DESCRIPTION: Places a magenta 110x104 rectangle at position (353, 28).
; PLAN: r0=353(x), r1=28(y), r2=110(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 28
LDI r2, 110
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
