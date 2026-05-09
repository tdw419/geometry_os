; DESCRIPTION: Renders a magenta box of size 32x22 starting at (470, 144).
; PLAN: r0=470(x), r1=144(y), r2=32(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 144
LDI r2, 32
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
