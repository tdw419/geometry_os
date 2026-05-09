; DESCRIPTION: Places a magenta 90x78 rectangle at position (164, 60).
; PLAN: r0=164(x), r1=60(y), r2=90(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 60
LDI r2, 90
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
