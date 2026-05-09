; DESCRIPTION: Creates a white rectangular region at (312, 166) spanning 46 by 16 pixels.
; PLAN: r0=312(x), r1=166(y), r2=46(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 166
LDI r2, 46
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
