; DESCRIPTION: Creates a blue rectangular region at (295, 163) spanning 57 by 84 pixels.
; PLAN: r0=295(x), r1=163(y), r2=57(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 163
LDI r2, 57
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
