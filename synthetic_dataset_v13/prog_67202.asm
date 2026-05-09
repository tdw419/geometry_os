; DESCRIPTION: Creates a purple rectangular region at (390, 129) spanning 58 by 25 pixels.
; PLAN: r0=390(x), r1=129(y), r2=58(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 129
LDI r2, 58
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
