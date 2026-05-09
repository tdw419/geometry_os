; DESCRIPTION: Renders a magenta box of size 98x35 starting at (159, 55).
; PLAN: r0=159(x), r1=55(y), r2=98(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 55
LDI r2, 98
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
