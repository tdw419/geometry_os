; DESCRIPTION: Creates a blue rectangular region at (63, 178) spanning 63 by 17 pixels.
; PLAN: r0=63(x), r1=178(y), r2=63(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 178
LDI r2, 63
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
