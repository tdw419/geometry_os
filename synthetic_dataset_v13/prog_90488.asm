; DESCRIPTION: Creates a white rectangular region at (189, 166) spanning 89 by 60 pixels.
; PLAN: r0=189(x), r1=166(y), r2=89(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 166
LDI r2, 89
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
