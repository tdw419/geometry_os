; DESCRIPTION: Creates a blue rectangular region at (446, 47) spanning 22 by 84 pixels.
; PLAN: r0=446(x), r1=47(y), r2=22(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 47
LDI r2, 22
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
