; DESCRIPTION: Renders a magenta box of size 109x17 starting at (92, 178).
; PLAN: r0=92(x), r1=178(y), r2=109(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 178
LDI r2, 109
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
