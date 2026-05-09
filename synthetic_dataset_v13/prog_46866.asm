; DESCRIPTION: Creates a white rectangular region at (107, 98) spanning 71 by 112 pixels.
; PLAN: r0=107(x), r1=98(y), r2=71(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 98
LDI r2, 71
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
