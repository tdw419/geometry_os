; DESCRIPTION: Renders a magenta box of size 57x64 starting at (61, 94).
; PLAN: r0=61(x), r1=94(y), r2=57(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 94
LDI r2, 57
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
