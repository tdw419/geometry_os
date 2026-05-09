; DESCRIPTION: Creates a blue rectangular region at (171, 52) spanning 68 by 31 pixels.
; PLAN: r0=171(x), r1=52(y), r2=68(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 52
LDI r2, 68
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
