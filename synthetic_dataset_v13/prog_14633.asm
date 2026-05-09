; DESCRIPTION: Creates a black rectangular region at (247, 83) spanning 80 by 25 pixels.
; PLAN: r0=247(x), r1=83(y), r2=80(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 83
LDI r2, 80
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
