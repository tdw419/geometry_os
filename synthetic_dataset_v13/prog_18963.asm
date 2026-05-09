; DESCRIPTION: Creates a blue rectangular region at (139, 129) spanning 96 by 105 pixels.
; PLAN: r0=139(x), r1=129(y), r2=96(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 129
LDI r2, 96
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
