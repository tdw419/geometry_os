; DESCRIPTION: Creates a white rectangular region at (75, 154) spanning 114 by 83 pixels.
; PLAN: r0=75(x), r1=154(y), r2=114(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 154
LDI r2, 114
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
