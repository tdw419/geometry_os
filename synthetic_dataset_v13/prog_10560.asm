; DESCRIPTION: Creates a black rectangular region at (229, 81) spanning 96 by 40 pixels.
; PLAN: r0=229(x), r1=81(y), r2=96(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 81
LDI r2, 96
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
