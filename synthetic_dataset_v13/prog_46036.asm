; DESCRIPTION: Creates a black rectangular region at (371, 26) spanning 109 by 117 pixels.
; PLAN: r0=371(x), r1=26(y), r2=109(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 26
LDI r2, 109
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
