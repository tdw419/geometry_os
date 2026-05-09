; DESCRIPTION: Renders a magenta box of size 59x17 starting at (29, 209).
; PLAN: r0=29(x), r1=209(y), r2=59(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 209
LDI r2, 59
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
