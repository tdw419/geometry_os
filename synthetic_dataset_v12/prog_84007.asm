; DESCRIPTION: Renders a magenta box of size 113x48 starting at (25, 75).
; PLAN: r0=25(x), r1=75(y), r2=113(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 75
LDI r2, 113
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
