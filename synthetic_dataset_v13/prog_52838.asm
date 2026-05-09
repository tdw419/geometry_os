; DESCRIPTION: Creates a black rectangular region at (192, 129) spanning 41 by 117 pixels.
; PLAN: r0=192(x), r1=129(y), r2=41(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 129
LDI r2, 41
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
