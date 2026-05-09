; DESCRIPTION: Places a magenta 97x45 rectangle at position (237, 38).
; PLAN: r0=237(x), r1=38(y), r2=97(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 38
LDI r2, 97
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
