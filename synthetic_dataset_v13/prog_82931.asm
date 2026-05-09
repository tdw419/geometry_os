; DESCRIPTION: Renders a magenta box of size 57x61 starting at (246, 33).
; PLAN: r0=246(x), r1=33(y), r2=57(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 33
LDI r2, 57
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
