; DESCRIPTION: Creates a blue rectangular region at (16, 163) spanning 20 by 24 pixels.
; PLAN: r0=16(x), r1=163(y), r2=20(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 163
LDI r2, 20
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
