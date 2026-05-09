; DESCRIPTION: Creates a white rectangular region at (274, 29) spanning 95 by 58 pixels.
; PLAN: r0=274(x), r1=29(y), r2=95(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 29
LDI r2, 95
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
