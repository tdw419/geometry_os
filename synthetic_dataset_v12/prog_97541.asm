; DESCRIPTION: Creates a blue rectangular region at (386, 87) spanning 63 by 108 pixels.
; PLAN: r0=386(x), r1=87(y), r2=63(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 87
LDI r2, 63
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
