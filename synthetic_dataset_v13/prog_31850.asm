; DESCRIPTION: Creates a blue rectangular region at (358, 57) spanning 61 by 92 pixels.
; PLAN: r0=358(x), r1=57(y), r2=61(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 57
LDI r2, 61
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
