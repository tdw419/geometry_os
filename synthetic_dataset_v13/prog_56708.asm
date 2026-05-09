; DESCRIPTION: Creates a black rectangular region at (74, 26) spanning 57 by 104 pixels.
; PLAN: r0=74(x), r1=26(y), r2=57(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 26
LDI r2, 57
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
