; DESCRIPTION: Creates a green rectangular region at (312, 202) spanning 39 by 35 pixels.
; PLAN: r0=312(x), r1=202(y), r2=39(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 202
LDI r2, 39
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
