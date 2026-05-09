; DESCRIPTION: Creates a white rectangular region at (51, 112) spanning 93 by 80 pixels.
; PLAN: r0=51(x), r1=112(y), r2=93(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 112
LDI r2, 93
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
