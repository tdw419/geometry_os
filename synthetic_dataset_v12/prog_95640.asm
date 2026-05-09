; DESCRIPTION: Creates a magenta rectangular region at (197, 117) spanning 94 by 89 pixels.
; PLAN: r0=197(x), r1=117(y), r2=94(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 117
LDI r2, 94
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
