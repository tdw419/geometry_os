; DESCRIPTION: Creates a black rectangular region at (187, 81) spanning 15 by 75 pixels.
; PLAN: r0=187(x), r1=81(y), r2=15(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 81
LDI r2, 15
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
