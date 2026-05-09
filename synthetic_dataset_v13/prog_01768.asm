; DESCRIPTION: Renders a magenta box of size 99x90 starting at (31, 151).
; PLAN: r0=31(x), r1=151(y), r2=99(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 151
LDI r2, 99
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
