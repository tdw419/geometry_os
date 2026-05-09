; DESCRIPTION: Creates a blue rectangular region at (325, 83) spanning 68 by 65 pixels.
; PLAN: r0=325(x), r1=83(y), r2=68(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 83
LDI r2, 68
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
