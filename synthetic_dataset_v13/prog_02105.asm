; DESCRIPTION: Creates a black rectangular region at (240, 55) spanning 87 by 52 pixels.
; PLAN: r0=240(x), r1=55(y), r2=87(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 55
LDI r2, 87
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
