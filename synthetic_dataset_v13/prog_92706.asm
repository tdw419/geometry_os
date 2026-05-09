; DESCRIPTION: Renders a magenta box of size 16x70 starting at (473, 147).
; PLAN: r0=473(x), r1=147(y), r2=16(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 147
LDI r2, 16
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
