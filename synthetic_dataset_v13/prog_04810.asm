; DESCRIPTION: Creates a green rectangular region at (426, 73) spanning 29 by 52 pixels.
; PLAN: r0=426(x), r1=73(y), r2=29(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 73
LDI r2, 29
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
