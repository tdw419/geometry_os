; DESCRIPTION: Places a magenta 110x37 rectangle at position (151, 177).
; PLAN: r0=151(x), r1=177(y), r2=110(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 177
LDI r2, 110
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
