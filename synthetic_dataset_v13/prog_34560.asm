; DESCRIPTION: Renders a magenta box of size 84x62 starting at (77, 190).
; PLAN: r0=77(x), r1=190(y), r2=84(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 190
LDI r2, 84
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
