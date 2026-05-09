; DESCRIPTION: Creates a black rectangular region at (281, 163) spanning 98 by 15 pixels.
; PLAN: r0=281(x), r1=163(y), r2=98(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 163
LDI r2, 98
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
