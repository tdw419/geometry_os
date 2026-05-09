; DESCRIPTION: Places a magenta 98x37 rectangle at position (321, 106).
; PLAN: r0=321(x), r1=106(y), r2=98(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 106
LDI r2, 98
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
