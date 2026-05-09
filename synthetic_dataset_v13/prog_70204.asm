; DESCRIPTION: Creates a magenta rectangular region at (151, 43) spanning 117 by 110 pixels.
; PLAN: r0=151(x), r1=43(y), r2=117(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 43
LDI r2, 117
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
