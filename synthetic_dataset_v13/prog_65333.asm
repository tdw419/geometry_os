; DESCRIPTION: Creates a white rectangular region at (177, 20) spanning 107 by 55 pixels.
; PLAN: r0=177(x), r1=20(y), r2=107(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 20
LDI r2, 107
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
