; DESCRIPTION: Creates a white rectangular region at (332, 93) spanning 37 by 112 pixels.
; PLAN: r0=332(x), r1=93(y), r2=37(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 93
LDI r2, 37
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
