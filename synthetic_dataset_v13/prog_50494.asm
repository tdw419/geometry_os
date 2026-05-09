; DESCRIPTION: Creates a blue rectangular region at (92, 93) spanning 115 by 89 pixels.
; PLAN: r0=92(x), r1=93(y), r2=115(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 93
LDI r2, 115
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
