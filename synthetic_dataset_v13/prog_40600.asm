; DESCRIPTION: Creates a black rectangular region at (178, 94) spanning 100 by 80 pixels.
; PLAN: r0=178(x), r1=94(y), r2=100(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 94
LDI r2, 100
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
