; DESCRIPTION: Places a magenta 91x78 rectangle at position (186, 140).
; PLAN: r0=186(x), r1=140(y), r2=91(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 140
LDI r2, 91
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
