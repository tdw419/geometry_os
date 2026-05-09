; DESCRIPTION: Creates a blue rectangular region at (72, 120) spanning 108 by 26 pixels.
; PLAN: r0=72(x), r1=120(y), r2=108(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 120
LDI r2, 108
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
