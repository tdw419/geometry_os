; DESCRIPTION: Places a magenta 17x71 rectangle at position (73, 94).
; PLAN: r0=73(x), r1=94(y), r2=17(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 94
LDI r2, 17
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
