; DESCRIPTION: Renders a magenta box of size 118x45 starting at (92, 80).
; PLAN: r0=92(x), r1=80(y), r2=118(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 80
LDI r2, 118
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
