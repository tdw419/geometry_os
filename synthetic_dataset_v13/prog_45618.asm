; DESCRIPTION: Creates a yellow rectangular region at (165, 4) spanning 39 by 105 pixels.
; PLAN: r0=165(x), r1=4(y), r2=39(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 4
LDI r2, 39
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
