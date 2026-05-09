; DESCRIPTION: Creates a white rectangular region at (367, 182) spanning 38 by 37 pixels.
; PLAN: r0=367(x), r1=182(y), r2=38(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 182
LDI r2, 38
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
