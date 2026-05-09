; DESCRIPTION: Creates a blue rectangular region at (355, 129) spanning 119 by 109 pixels.
; PLAN: r0=355(x), r1=129(y), r2=119(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 129
LDI r2, 119
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
