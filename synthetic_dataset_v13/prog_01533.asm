; DESCRIPTION: Creates a blue rectangular region at (249, 53) spanning 68 by 33 pixels.
; PLAN: r0=249(x), r1=53(y), r2=68(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 53
LDI r2, 68
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
