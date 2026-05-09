; DESCRIPTION: Creates a white rectangular region at (169, 188) spanning 93 by 35 pixels.
; PLAN: r0=169(x), r1=188(y), r2=93(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 188
LDI r2, 93
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
