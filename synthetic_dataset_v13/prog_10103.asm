; DESCRIPTION: Creates a yellow rectangular region at (460, 125) spanning 49 by 119 pixels.
; PLAN: r0=460(x), r1=125(y), r2=49(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 125
LDI r2, 49
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
