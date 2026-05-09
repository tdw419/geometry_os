; DESCRIPTION: Creates a blue rectangular region at (14, 21) spanning 58 by 109 pixels.
; PLAN: r0=14(x), r1=21(y), r2=58(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 21
LDI r2, 58
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
