; DESCRIPTION: Creates a black rectangular region at (329, 174) spanning 49 by 73 pixels.
; PLAN: r0=329(x), r1=174(y), r2=49(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 174
LDI r2, 49
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
