; DESCRIPTION: Creates a white rectangular region at (95, 75) spanning 108 by 61 pixels.
; PLAN: r0=95(x), r1=75(y), r2=108(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 75
LDI r2, 108
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
