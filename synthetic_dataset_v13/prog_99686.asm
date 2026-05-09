; DESCRIPTION: Creates a white rectangular region at (248, 104) spanning 60 by 73 pixels.
; PLAN: r0=248(x), r1=104(y), r2=60(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 104
LDI r2, 60
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
