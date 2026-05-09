; DESCRIPTION: Creates a white rectangular region at (406, 174) spanning 37 by 71 pixels.
; PLAN: r0=406(x), r1=174(y), r2=37(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 174
LDI r2, 37
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
