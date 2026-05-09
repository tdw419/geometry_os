; DESCRIPTION: Creates a blue rectangular region at (160, 140) spanning 32 by 20 pixels.
; PLAN: r0=160(x), r1=140(y), r2=32(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 140
LDI r2, 32
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
