; DESCRIPTION: Renders a magenta box of size 89x105 starting at (60, 55).
; PLAN: r0=60(x), r1=55(y), r2=89(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 55
LDI r2, 89
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
