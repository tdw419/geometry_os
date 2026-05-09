; DESCRIPTION: Creates a black rectangular region at (460, 115) spanning 34 by 75 pixels.
; PLAN: r0=460(x), r1=115(y), r2=34(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 115
LDI r2, 34
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
