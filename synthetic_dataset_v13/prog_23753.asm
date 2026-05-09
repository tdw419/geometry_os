; DESCRIPTION: Creates a magenta rectangular region at (268, 111) spanning 80 by 106 pixels.
; PLAN: r0=268(x), r1=111(y), r2=80(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 111
LDI r2, 80
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
