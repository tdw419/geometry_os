; DESCRIPTION: Creates a black rectangular region at (120, 129) spanning 17 by 26 pixels.
; PLAN: r0=120(x), r1=129(y), r2=17(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 129
LDI r2, 17
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
