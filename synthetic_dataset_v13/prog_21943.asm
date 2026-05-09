; DESCRIPTION: Creates a green rectangular region at (71, 34) spanning 58 by 81 pixels.
; PLAN: r0=71(x), r1=34(y), r2=58(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 34
LDI r2, 58
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
