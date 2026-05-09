; DESCRIPTION: Creates a black rectangular region at (219, 129) spanning 90 by 35 pixels.
; PLAN: r0=219(x), r1=129(y), r2=90(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 129
LDI r2, 90
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
