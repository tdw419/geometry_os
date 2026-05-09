; DESCRIPTION: Creates a white rectangular region at (342, 3) spanning 46 by 81 pixels.
; PLAN: r0=342(x), r1=3(y), r2=46(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 3
LDI r2, 46
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
