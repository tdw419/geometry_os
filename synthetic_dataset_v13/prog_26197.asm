; DESCRIPTION: Creates a green rectangular region at (299, 64) spanning 108 by 71 pixels.
; PLAN: r0=299(x), r1=64(y), r2=108(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 64
LDI r2, 108
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
