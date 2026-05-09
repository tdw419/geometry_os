; DESCRIPTION: Creates a magenta rectangular region at (347, 111) spanning 83 by 67 pixels.
; PLAN: r0=347(x), r1=111(y), r2=83(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 111
LDI r2, 83
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
