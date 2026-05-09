; DESCRIPTION: Creates a green rectangular region at (448, 167) spanning 57 by 41 pixels.
; PLAN: r0=448(x), r1=167(y), r2=57(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 167
LDI r2, 57
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
