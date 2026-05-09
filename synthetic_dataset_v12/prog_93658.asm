; DESCRIPTION: Places a magenta 90x63 rectangle at position (32, 44).
; PLAN: r0=32(x), r1=44(y), r2=90(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 44
LDI r2, 90
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
