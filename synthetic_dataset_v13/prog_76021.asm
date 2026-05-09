; DESCRIPTION: Renders a magenta box of size 64x43 starting at (77, 154).
; PLAN: r0=77(x), r1=154(y), r2=64(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 154
LDI r2, 64
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
