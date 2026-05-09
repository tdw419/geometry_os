; DESCRIPTION: Creates a magenta rectangular region at (94, 74) spanning 109 by 79 pixels.
; PLAN: r0=94(x), r1=74(y), r2=109(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 74
LDI r2, 109
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
