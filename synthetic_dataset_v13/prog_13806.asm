; DESCRIPTION: Creates a black rectangular region at (168, 104) spanning 61 by 97 pixels.
; PLAN: r0=168(x), r1=104(y), r2=61(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 104
LDI r2, 61
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
