; DESCRIPTION: Places a magenta 117x77 rectangle at position (134, 94).
; PLAN: r0=134(x), r1=94(y), r2=117(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 94
LDI r2, 117
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
