; DESCRIPTION: Creates a blue rectangular region at (102, 12) spanning 52 by 47 pixels.
; PLAN: r0=102(x), r1=12(y), r2=52(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 12
LDI r2, 52
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
