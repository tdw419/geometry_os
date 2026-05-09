; DESCRIPTION: Creates a black rectangular region at (171, 129) spanning 75 by 107 pixels.
; PLAN: r0=171(x), r1=129(y), r2=75(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 129
LDI r2, 75
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
