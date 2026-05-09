; DESCRIPTION: Places a magenta 58x118 rectangle at position (321, 125).
; PLAN: r0=321(x), r1=125(y), r2=58(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 125
LDI r2, 58
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
