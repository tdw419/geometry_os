; DESCRIPTION: Creates a black rectangular region at (372, 38) spanning 30 by 118 pixels.
; PLAN: r0=372(x), r1=38(y), r2=30(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 38
LDI r2, 30
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
