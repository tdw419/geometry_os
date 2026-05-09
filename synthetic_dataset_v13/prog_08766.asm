; DESCRIPTION: Creates a white rectangular region at (58, 186) spanning 75 by 60 pixels.
; PLAN: r0=58(x), r1=186(y), r2=75(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 186
LDI r2, 75
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
