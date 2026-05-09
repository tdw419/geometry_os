; DESCRIPTION: Creates a purple rectangular region at (472, 129) spanning 29 by 79 pixels.
; PLAN: r0=472(x), r1=129(y), r2=29(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 129
LDI r2, 29
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
