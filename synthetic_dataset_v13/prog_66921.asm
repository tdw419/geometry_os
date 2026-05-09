; DESCRIPTION: Creates a blue rectangular region at (333, 29) spanning 100 by 57 pixels.
; PLAN: r0=333(x), r1=29(y), r2=100(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 29
LDI r2, 100
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
