; DESCRIPTION: Renders a magenta box of size 16x37 starting at (420, 130).
; PLAN: r0=420(x), r1=130(y), r2=16(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 130
LDI r2, 16
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
