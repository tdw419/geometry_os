; DESCRIPTION: Renders a magenta box of size 68x37 starting at (18, 39).
; PLAN: r0=18(x), r1=39(y), r2=68(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 39
LDI r2, 68
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
