; DESCRIPTION: Renders a blue box of size 42x71 starting at (343, 180).
; PLAN: r0=343(x), r1=180(y), r2=42(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 180
LDI r2, 42
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
