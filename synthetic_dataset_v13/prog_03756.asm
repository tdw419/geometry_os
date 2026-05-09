; DESCRIPTION: Renders a magenta box of size 86x119 starting at (241, 92).
; PLAN: r0=241(x), r1=92(y), r2=86(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 92
LDI r2, 86
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
