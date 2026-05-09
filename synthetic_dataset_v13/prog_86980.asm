; DESCRIPTION: Creates a blue rectangular region at (48, 163) spanning 64 by 74 pixels.
; PLAN: r0=48(x), r1=163(y), r2=64(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 163
LDI r2, 64
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
