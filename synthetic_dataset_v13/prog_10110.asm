; DESCRIPTION: Creates a black rectangular region at (233, 96) spanning 48 by 90 pixels.
; PLAN: r0=233(x), r1=96(y), r2=48(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 96
LDI r2, 48
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
