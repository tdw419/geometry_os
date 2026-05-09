; DESCRIPTION: Creates a black rectangular region at (393, 72) spanning 45 by 75 pixels.
; PLAN: r0=393(x), r1=72(y), r2=45(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 72
LDI r2, 45
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
