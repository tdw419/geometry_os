; DESCRIPTION: Creates a magenta rectangular region at (184, 220) spanning 53 by 17 pixels.
; PLAN: r0=184(x), r1=220(y), r2=53(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 220
LDI r2, 53
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
