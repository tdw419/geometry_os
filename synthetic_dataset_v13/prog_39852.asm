; DESCRIPTION: Creates a white rectangular region at (315, 161) spanning 108 by 93 pixels.
; PLAN: r0=315(x), r1=161(y), r2=108(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 161
LDI r2, 108
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
