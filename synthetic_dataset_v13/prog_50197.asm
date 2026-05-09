; DESCRIPTION: Creates a black rectangular region at (198, 163) spanning 14 by 91 pixels.
; PLAN: r0=198(x), r1=163(y), r2=14(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 163
LDI r2, 14
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
