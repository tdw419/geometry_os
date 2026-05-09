; DESCRIPTION: Creates a black rectangular region at (125, 177) spanning 30 by 54 pixels.
; PLAN: r0=125(x), r1=177(y), r2=30(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 177
LDI r2, 30
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
