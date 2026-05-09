; DESCRIPTION: Places a magenta 63x47 rectangle at position (325, 126).
; PLAN: r0=325(x), r1=126(y), r2=63(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 126
LDI r2, 63
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
