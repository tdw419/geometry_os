; DESCRIPTION: Creates a white rectangular region at (125, 163) spanning 100 by 40 pixels.
; PLAN: r0=125(x), r1=163(y), r2=100(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 163
LDI r2, 100
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
