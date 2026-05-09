; DESCRIPTION: Renders a magenta box of size 65x120 starting at (429, 135).
; PLAN: r0=429(x), r1=135(y), r2=65(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 135
LDI r2, 65
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
