; DESCRIPTION: Creates a white rectangular region at (380, 145) spanning 102 by 36 pixels.
; PLAN: r0=380(x), r1=145(y), r2=102(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 145
LDI r2, 102
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
