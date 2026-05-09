; DESCRIPTION: Creates a blue rectangular region at (445, 123) spanning 14 by 57 pixels.
; PLAN: r0=445(x), r1=123(y), r2=14(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 123
LDI r2, 14
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
