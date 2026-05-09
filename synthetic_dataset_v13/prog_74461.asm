; DESCRIPTION: Creates a magenta rectangular region at (417, 179) spanning 94 by 67 pixels.
; PLAN: r0=417(x), r1=179(y), r2=94(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 179
LDI r2, 94
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
