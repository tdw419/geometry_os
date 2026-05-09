; DESCRIPTION: Creates a white rectangular region at (73, 125) spanning 73 by 59 pixels.
; PLAN: r0=73(x), r1=125(y), r2=73(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 125
LDI r2, 73
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
