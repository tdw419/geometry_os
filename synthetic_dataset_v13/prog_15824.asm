; DESCRIPTION: Creates a magenta rectangular region at (380, 132) spanning 25 by 106 pixels.
; PLAN: r0=380(x), r1=132(y), r2=25(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 132
LDI r2, 25
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
