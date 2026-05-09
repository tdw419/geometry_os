; DESCRIPTION: Places a magenta 35x49 rectangle at position (433, 160).
; PLAN: r0=433(x), r1=160(y), r2=35(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 160
LDI r2, 35
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
