; DESCRIPTION: Creates a black rectangular region at (164, 138) spanning 40 by 96 pixels.
; PLAN: r0=164(x), r1=138(y), r2=40(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 138
LDI r2, 40
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
