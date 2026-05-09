; DESCRIPTION: Renders a magenta box of size 89x33 starting at (119, 177).
; PLAN: r0=119(x), r1=177(y), r2=89(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 177
LDI r2, 89
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
