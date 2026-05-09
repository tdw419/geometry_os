; DESCRIPTION: Renders a magenta box of size 90x103 starting at (215, 151).
; PLAN: r0=215(x), r1=151(y), r2=90(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 151
LDI r2, 90
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
