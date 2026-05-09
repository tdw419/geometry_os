; DESCRIPTION: Places a magenta 118x78 rectangle at position (340, 16).
; PLAN: r0=340(x), r1=16(y), r2=118(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 16
LDI r2, 118
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
