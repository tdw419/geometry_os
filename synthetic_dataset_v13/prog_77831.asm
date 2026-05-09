; DESCRIPTION: Places a magenta 109x110 rectangle at position (271, 58).
; PLAN: r0=271(x), r1=58(y), r2=109(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 58
LDI r2, 109
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
