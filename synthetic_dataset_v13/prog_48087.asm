; DESCRIPTION: Creates a green rectangular region at (384, 74) spanning 71 by 91 pixels.
; PLAN: r0=384(x), r1=74(y), r2=71(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 74
LDI r2, 71
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
