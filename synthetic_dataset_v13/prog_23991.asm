; DESCRIPTION: Creates a green rectangular region at (121, 26) spanning 54 by 71 pixels.
; PLAN: r0=121(x), r1=26(y), r2=54(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 26
LDI r2, 54
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
