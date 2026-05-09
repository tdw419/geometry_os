; DESCRIPTION: Creates a blue rectangular region at (63, 15) spanning 34 by 117 pixels.
; PLAN: r0=63(x), r1=15(y), r2=34(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 15
LDI r2, 34
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
