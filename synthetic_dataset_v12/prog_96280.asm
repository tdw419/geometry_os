; DESCRIPTION: Creates a blue rectangular region at (432, 53) spanning 57 by 71 pixels.
; PLAN: r0=432(x), r1=53(y), r2=57(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 53
LDI r2, 57
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
