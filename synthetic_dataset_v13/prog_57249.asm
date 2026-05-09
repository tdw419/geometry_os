; DESCRIPTION: Creates a black rectangular region at (289, 16) spanning 75 by 117 pixels.
; PLAN: r0=289(x), r1=16(y), r2=75(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 16
LDI r2, 75
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
