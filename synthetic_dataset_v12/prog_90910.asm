; DESCRIPTION: Creates a red rectangular region at (105, 98) spanning 51 by 28 pixels.
; PLAN: r0=105(x), r1=98(y), r2=51(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 98
LDI r2, 51
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
