; DESCRIPTION: Creates a white rectangular region at (211, 136) spanning 100 by 25 pixels.
; PLAN: r0=211(x), r1=136(y), r2=100(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 136
LDI r2, 100
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
