; DESCRIPTION: Creates a white rectangular region at (178, 182) spanning 13 by 51 pixels.
; PLAN: r0=178(x), r1=182(y), r2=13(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 182
LDI r2, 13
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
