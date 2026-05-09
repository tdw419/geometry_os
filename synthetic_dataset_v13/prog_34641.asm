; DESCRIPTION: Creates a black rectangular region at (108, 129) spanning 106 by 113 pixels.
; PLAN: r0=108(x), r1=129(y), r2=106(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 129
LDI r2, 106
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
