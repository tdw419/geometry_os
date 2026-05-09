; DESCRIPTION: Places a magenta 85x72 rectangle at position (136, 152).
; PLAN: r0=136(x), r1=152(y), r2=85(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 152
LDI r2, 85
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
