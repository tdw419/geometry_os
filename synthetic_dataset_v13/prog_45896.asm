; DESCRIPTION: Creates a blue rectangular region at (3, 98) spanning 21 by 85 pixels.
; PLAN: r0=3(x), r1=98(y), r2=21(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 98
LDI r2, 21
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
