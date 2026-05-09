; DESCRIPTION: Creates a yellow rectangular region at (35, 129) spanning 108 by 98 pixels.
; PLAN: r0=35(x), r1=129(y), r2=108(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 129
LDI r2, 108
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
