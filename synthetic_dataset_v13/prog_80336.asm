; DESCRIPTION: Places a magenta 90x29 rectangle at position (61, 94).
; PLAN: r0=61(x), r1=94(y), r2=90(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 94
LDI r2, 90
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
