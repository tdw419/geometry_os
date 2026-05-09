; DESCRIPTION: Places a magenta 106x37 rectangle at position (248, 65).
; PLAN: r0=248(x), r1=65(y), r2=106(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 65
LDI r2, 106
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
