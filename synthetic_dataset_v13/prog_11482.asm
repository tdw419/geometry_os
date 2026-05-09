; DESCRIPTION: Creates a magenta rectangular region at (285, 176) spanning 113 by 17 pixels.
; PLAN: r0=285(x), r1=176(y), r2=113(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 176
LDI r2, 113
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
