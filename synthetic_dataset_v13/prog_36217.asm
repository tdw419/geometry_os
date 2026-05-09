; DESCRIPTION: Creates a black rectangular region at (425, 119) spanning 28 by 94 pixels.
; PLAN: r0=425(x), r1=119(y), r2=28(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 119
LDI r2, 28
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
