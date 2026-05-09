; DESCRIPTION: Creates a white rectangular region at (125, 10) spanning 92 by 51 pixels.
; PLAN: r0=125(x), r1=10(y), r2=92(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 10
LDI r2, 92
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
