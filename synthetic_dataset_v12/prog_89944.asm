; DESCRIPTION: Places a magenta 31x63 rectangle at position (199, 65).
; PLAN: r0=199(x), r1=65(y), r2=31(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 65
LDI r2, 31
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
