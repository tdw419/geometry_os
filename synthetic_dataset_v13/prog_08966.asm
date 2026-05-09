; DESCRIPTION: Creates a white rectangular region at (322, 125) spanning 53 by 12 pixels.
; PLAN: r0=322(x), r1=125(y), r2=53(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 125
LDI r2, 53
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
