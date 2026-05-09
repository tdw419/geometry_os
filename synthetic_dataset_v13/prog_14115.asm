; DESCRIPTION: Creates a black rectangular region at (344, 142) spanning 74 by 109 pixels.
; PLAN: r0=344(x), r1=142(y), r2=74(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 142
LDI r2, 74
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
