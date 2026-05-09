; DESCRIPTION: Creates a blue rectangular region at (150, 145) spanning 67 by 31 pixels.
; PLAN: r0=150(x), r1=145(y), r2=67(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 145
LDI r2, 67
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
