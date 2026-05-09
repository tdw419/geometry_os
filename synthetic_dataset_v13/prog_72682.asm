; DESCRIPTION: Creates a white rectangular region at (17, 166) spanning 112 by 57 pixels.
; PLAN: r0=17(x), r1=166(y), r2=112(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 166
LDI r2, 112
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
