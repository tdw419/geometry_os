; DESCRIPTION: Creates a white rectangular region at (132, 124) spanning 89 by 68 pixels.
; PLAN: r0=132(x), r1=124(y), r2=89(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 124
LDI r2, 89
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
