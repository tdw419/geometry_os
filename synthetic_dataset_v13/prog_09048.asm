; DESCRIPTION: Creates a red rectangular region at (183, 51) spanning 10 by 28 pixels.
; PLAN: r0=183(x), r1=51(y), r2=10(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 51
LDI r2, 10
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
