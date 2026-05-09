; DESCRIPTION: Creates a white rectangular region at (207, 142) spanning 43 by 92 pixels.
; PLAN: r0=207(x), r1=142(y), r2=43(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 142
LDI r2, 43
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
