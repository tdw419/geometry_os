; DESCRIPTION: Creates a black rectangular region at (304, 4) spanning 104 by 44 pixels.
; PLAN: r0=304(x), r1=4(y), r2=104(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 4
LDI r2, 104
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
