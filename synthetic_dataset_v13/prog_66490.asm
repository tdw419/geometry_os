; DESCRIPTION: Places a magenta 110x65 rectangle at position (264, 50).
; PLAN: r0=264(x), r1=50(y), r2=110(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 50
LDI r2, 110
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
