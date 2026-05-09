; DESCRIPTION: Renders a magenta box of size 95x45 starting at (225, 0).
; PLAN: r0=225(x), r1=0(y), r2=95(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 0
LDI r2, 95
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
