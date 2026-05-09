; DESCRIPTION: Creates a blue rectangular region at (120, 108) spanning 17 by 23 pixels.
; PLAN: r0=120(x), r1=108(y), r2=17(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 108
LDI r2, 17
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
