; DESCRIPTION: Renders a magenta box of size 113x48 starting at (85, 108).
; PLAN: r0=85(x), r1=108(y), r2=113(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 108
LDI r2, 113
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
