; DESCRIPTION: Creates a green rectangular region at (73, 19) spanning 30 by 29 pixels.
; PLAN: r0=73(x), r1=19(y), r2=30(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 19
LDI r2, 30
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
