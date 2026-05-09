; DESCRIPTION: Creates a green rectangular region at (343, 142) spanning 51 by 50 pixels.
; PLAN: r0=343(x), r1=142(y), r2=51(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 142
LDI r2, 51
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
