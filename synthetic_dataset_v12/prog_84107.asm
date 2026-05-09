; DESCRIPTION: Creates a blue rectangular region at (4, 129) spanning 116 by 62 pixels.
; PLAN: r0=4(x), r1=129(y), r2=116(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 129
LDI r2, 116
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
