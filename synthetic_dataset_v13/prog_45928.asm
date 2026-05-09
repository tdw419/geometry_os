; DESCRIPTION: Creates a green rectangular region at (177, 98) spanning 31 by 43 pixels.
; PLAN: r0=177(x), r1=98(y), r2=31(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 98
LDI r2, 31
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
