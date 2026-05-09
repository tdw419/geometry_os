; DESCRIPTION: Creates a white rectangular region at (138, 53) spanning 45 by 65 pixels.
; PLAN: r0=138(x), r1=53(y), r2=45(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 53
LDI r2, 45
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
