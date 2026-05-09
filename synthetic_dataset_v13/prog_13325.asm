; DESCRIPTION: Places a magenta 60x43 rectangle at position (141, 164).
; PLAN: r0=141(x), r1=164(y), r2=60(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 164
LDI r2, 60
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
