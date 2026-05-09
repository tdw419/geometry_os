; DESCRIPTION: Creates a white rectangular region at (250, 163) spanning 47 by 71 pixels.
; PLAN: r0=250(x), r1=163(y), r2=47(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 163
LDI r2, 47
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
