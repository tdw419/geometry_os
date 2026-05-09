; DESCRIPTION: Creates a black rectangular region at (344, 107) spanning 63 by 38 pixels.
; PLAN: r0=344(x), r1=107(y), r2=63(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 107
LDI r2, 63
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
