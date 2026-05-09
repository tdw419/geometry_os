; DESCRIPTION: Creates a green rectangular region at (483, 184) spanning 16 by 71 pixels.
; PLAN: r0=483(x), r1=184(y), r2=16(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 184
LDI r2, 16
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
