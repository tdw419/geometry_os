; DESCRIPTION: Creates a green rectangular region at (51, 134) spanning 118 by 113 pixels.
; PLAN: r0=51(x), r1=134(y), r2=118(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 134
LDI r2, 118
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
