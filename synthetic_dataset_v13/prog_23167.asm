; DESCRIPTION: Creates a black rectangular region at (198, 52) spanning 14 by 84 pixels.
; PLAN: r0=198(x), r1=52(y), r2=14(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 52
LDI r2, 14
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
