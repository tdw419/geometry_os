; DESCRIPTION: Renders a magenta box of size 55x65 starting at (163, 137).
; PLAN: r0=163(x), r1=137(y), r2=55(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 137
LDI r2, 55
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
