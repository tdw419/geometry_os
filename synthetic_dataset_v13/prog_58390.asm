; DESCRIPTION: Renders a magenta box of size 36x90 starting at (228, 23).
; PLAN: r0=228(x), r1=23(y), r2=36(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 23
LDI r2, 36
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
