; DESCRIPTION: Renders a magenta box of size 64x66 starting at (295, 2).
; PLAN: r0=295(x), r1=2(y), r2=64(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 2
LDI r2, 64
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
