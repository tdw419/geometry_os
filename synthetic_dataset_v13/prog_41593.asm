; DESCRIPTION: Creates a blue rectangular region at (301, 7) spanning 30 by 57 pixels.
; PLAN: r0=301(x), r1=7(y), r2=30(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 7
LDI r2, 30
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
