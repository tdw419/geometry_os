; DESCRIPTION: Places a magenta 33x85 rectangle at position (350, 50).
; PLAN: r0=350(x), r1=50(y), r2=33(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 50
LDI r2, 33
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
