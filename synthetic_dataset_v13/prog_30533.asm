; DESCRIPTION: Creates a white rectangular region at (298, 71) spanning 73 by 96 pixels.
; PLAN: r0=298(x), r1=71(y), r2=73(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 71
LDI r2, 73
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
