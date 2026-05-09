; DESCRIPTION: Renders a magenta box of size 70x98 starting at (268, 151).
; PLAN: r0=268(x), r1=151(y), r2=70(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 151
LDI r2, 70
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
