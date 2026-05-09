; DESCRIPTION: Places a magenta 90x45 rectangle at position (98, 109).
; PLAN: r0=98(x), r1=109(y), r2=90(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 109
LDI r2, 90
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
