; DESCRIPTION: Places a magenta 65x79 rectangle at position (319, 88).
; PLAN: r0=319(x), r1=88(y), r2=65(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 88
LDI r2, 65
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
