; DESCRIPTION: Places a magenta 25x50 rectangle at position (115, 188).
; PLAN: r0=115(x), r1=188(y), r2=25(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 188
LDI r2, 25
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
