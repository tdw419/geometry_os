; DESCRIPTION: Creates a magenta rectangular region at (347, 94) spanning 39 by 21 pixels.
; PLAN: r0=347(x), r1=94(y), r2=39(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 94
LDI r2, 39
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
