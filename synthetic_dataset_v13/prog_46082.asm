; DESCRIPTION: Creates a white rectangular region at (3, 75) spanning 51 by 120 pixels.
; PLAN: r0=3(x), r1=75(y), r2=51(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 75
LDI r2, 51
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
