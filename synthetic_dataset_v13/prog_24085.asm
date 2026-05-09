; DESCRIPTION: Creates a blue rectangular region at (356, 120) spanning 108 by 47 pixels.
; PLAN: r0=356(x), r1=120(y), r2=108(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 120
LDI r2, 108
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
