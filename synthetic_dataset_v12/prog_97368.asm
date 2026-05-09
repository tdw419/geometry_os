; DESCRIPTION: Creates a white rectangular region at (260, 158) spanning 53 by 47 pixels.
; PLAN: r0=260(x), r1=158(y), r2=53(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 158
LDI r2, 53
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
