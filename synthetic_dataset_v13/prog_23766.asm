; DESCRIPTION: Creates a green rectangular region at (143, 51) spanning 51 by 40 pixels.
; PLAN: r0=143(x), r1=51(y), r2=51(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 51
LDI r2, 51
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
