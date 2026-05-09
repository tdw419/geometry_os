; DESCRIPTION: Places a magenta 25x97 rectangle at position (47, 94).
; PLAN: r0=47(x), r1=94(y), r2=25(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 94
LDI r2, 25
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
