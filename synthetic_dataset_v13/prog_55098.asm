; DESCRIPTION: Renders a magenta box of size 45x98 starting at (177, 19).
; PLAN: r0=177(x), r1=19(y), r2=45(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 19
LDI r2, 45
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
