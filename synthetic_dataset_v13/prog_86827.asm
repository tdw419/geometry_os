; DESCRIPTION: Creates a blue rectangular region at (365, 98) spanning 92 by 58 pixels.
; PLAN: r0=365(x), r1=98(y), r2=92(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 98
LDI r2, 92
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
