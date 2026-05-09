; DESCRIPTION: Creates a white rectangular region at (418, 66) spanning 38 by 98 pixels.
; PLAN: r0=418(x), r1=66(y), r2=38(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 66
LDI r2, 38
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
