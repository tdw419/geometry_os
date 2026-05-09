; DESCRIPTION: Places a magenta 68x94 rectangle at position (436, 83).
; PLAN: r0=436(x), r1=83(y), r2=68(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 83
LDI r2, 68
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
