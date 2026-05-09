; DESCRIPTION: Creates a white rectangular region at (236, 138) spanning 43 by 57 pixels.
; PLAN: r0=236(x), r1=138(y), r2=43(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 138
LDI r2, 43
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
