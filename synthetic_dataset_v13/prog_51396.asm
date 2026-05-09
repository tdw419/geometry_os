; DESCRIPTION: Creates a blue rectangular region at (447, 21) spanning 34 by 75 pixels.
; PLAN: r0=447(x), r1=21(y), r2=34(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 21
LDI r2, 34
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
