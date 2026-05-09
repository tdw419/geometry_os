; DESCRIPTION: Creates a blue rectangular region at (129, 27) spanning 58 by 90 pixels.
; PLAN: r0=129(x), r1=27(y), r2=58(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 27
LDI r2, 58
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
