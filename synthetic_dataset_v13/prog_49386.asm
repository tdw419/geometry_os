; DESCRIPTION: Renders a magenta box of size 71x75 starting at (192, 29).
; PLAN: r0=192(x), r1=29(y), r2=71(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 29
LDI r2, 71
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
