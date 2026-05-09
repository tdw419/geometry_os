; DESCRIPTION: Places a magenta 87x96 rectangle at position (373, 96).
; PLAN: r0=373(x), r1=96(y), r2=87(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 96
LDI r2, 87
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
