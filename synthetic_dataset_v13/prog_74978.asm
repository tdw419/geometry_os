; DESCRIPTION: Creates a green rectangular region at (336, 190) spanning 51 by 43 pixels.
; PLAN: r0=336(x), r1=190(y), r2=51(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 190
LDI r2, 51
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
