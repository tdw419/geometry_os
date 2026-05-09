; DESCRIPTION: Creates a black rectangular region at (447, 25) spanning 20 by 29 pixels.
; PLAN: r0=447(x), r1=25(y), r2=20(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 25
LDI r2, 20
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
