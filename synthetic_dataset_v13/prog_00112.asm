; DESCRIPTION: Places a magenta 91x37 rectangle at position (81, 105).
; PLAN: r0=81(x), r1=105(y), r2=91(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 105
LDI r2, 91
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
