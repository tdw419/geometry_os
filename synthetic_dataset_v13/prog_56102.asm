; DESCRIPTION: Renders a magenta box of size 71x89 starting at (128, 95).
; PLAN: r0=128(x), r1=95(y), r2=71(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 95
LDI r2, 71
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
