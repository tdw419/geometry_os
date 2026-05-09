; DESCRIPTION: Creates a green rectangular region at (384, 34) spanning 23 by 85 pixels.
; PLAN: r0=384(x), r1=34(y), r2=23(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 34
LDI r2, 23
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
