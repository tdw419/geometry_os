; DESCRIPTION: Renders a magenta box of size 70x71 starting at (116, 150).
; PLAN: r0=116(x), r1=150(y), r2=70(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 150
LDI r2, 70
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
