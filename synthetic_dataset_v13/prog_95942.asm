; DESCRIPTION: Renders a magenta box of size 61x10 starting at (370, 216).
; PLAN: r0=370(x), r1=216(y), r2=61(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 216
LDI r2, 61
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
