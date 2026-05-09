; DESCRIPTION: Creates a blue rectangular region at (147, 57) spanning 67 by 56 pixels.
; PLAN: r0=147(x), r1=57(y), r2=67(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 57
LDI r2, 67
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
