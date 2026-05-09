; DESCRIPTION: Places a magenta 60x54 rectangle at position (340, 118).
; PLAN: r0=340(x), r1=118(y), r2=60(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 118
LDI r2, 60
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
