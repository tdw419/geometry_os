; DESCRIPTION: Places a magenta 17x36 rectangle at position (467, 83).
; PLAN: r0=467(x), r1=83(y), r2=17(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 83
LDI r2, 17
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
