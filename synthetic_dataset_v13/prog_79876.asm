; DESCRIPTION: Creates a black rectangular region at (177, 165) spanning 54 by 66 pixels.
; PLAN: r0=177(x), r1=165(y), r2=54(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 165
LDI r2, 54
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
