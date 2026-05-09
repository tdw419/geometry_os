; DESCRIPTION: Creates a white rectangular region at (81, 51) spanning 109 by 69 pixels.
; PLAN: r0=81(x), r1=51(y), r2=109(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 51
LDI r2, 109
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
