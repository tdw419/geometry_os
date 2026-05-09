; DESCRIPTION: Creates a blue rectangular region at (243, 18) spanning 80 by 31 pixels.
; PLAN: r0=243(x), r1=18(y), r2=80(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 18
LDI r2, 80
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
