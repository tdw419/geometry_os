; DESCRIPTION: Creates a magenta rectangular region at (159, 147) spanning 35 by 91 pixels.
; PLAN: r0=159(x), r1=147(y), r2=35(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 147
LDI r2, 35
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
