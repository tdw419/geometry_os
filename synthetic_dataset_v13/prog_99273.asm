; DESCRIPTION: Creates a green rectangular region at (53, 61) spanning 57 by 61 pixels.
; PLAN: r0=53(x), r1=61(y), r2=57(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 61
LDI r2, 57
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
