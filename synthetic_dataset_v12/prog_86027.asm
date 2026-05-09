; DESCRIPTION: Creates a green rectangular region at (453, 73) spanning 46 by 98 pixels.
; PLAN: r0=453(x), r1=73(y), r2=46(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 73
LDI r2, 46
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
