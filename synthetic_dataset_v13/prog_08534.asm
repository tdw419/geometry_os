; DESCRIPTION: Creates a magenta rectangular region at (104, 147) spanning 53 by 26 pixels.
; PLAN: r0=104(x), r1=147(y), r2=53(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 147
LDI r2, 53
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
