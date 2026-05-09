; DESCRIPTION: Creates a green rectangular region at (164, 54) spanning 34 by 74 pixels.
; PLAN: r0=164(x), r1=54(y), r2=34(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 54
LDI r2, 34
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
