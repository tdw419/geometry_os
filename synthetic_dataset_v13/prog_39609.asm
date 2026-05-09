; DESCRIPTION: Creates a white rectangular region at (30, 171) spanning 24 by 51 pixels.
; PLAN: r0=30(x), r1=171(y), r2=24(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 171
LDI r2, 24
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
