; DESCRIPTION: Creates a blue rectangular region at (32, 121) spanning 48 by 13 pixels.
; PLAN: r0=32(x), r1=121(y), r2=48(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 121
LDI r2, 48
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
