; DESCRIPTION: Renders a magenta box of size 64x33 starting at (70, 95).
; PLAN: r0=70(x), r1=95(y), r2=64(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 95
LDI r2, 64
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
