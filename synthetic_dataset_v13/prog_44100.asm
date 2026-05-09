; DESCRIPTION: Creates a white rectangular region at (51, 107) spanning 17 by 76 pixels.
; PLAN: r0=51(x), r1=107(y), r2=17(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 107
LDI r2, 17
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
