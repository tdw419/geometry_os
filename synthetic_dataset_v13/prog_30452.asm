; DESCRIPTION: Creates a white rectangular region at (169, 117) spanning 74 by 94 pixels.
; PLAN: r0=169(x), r1=117(y), r2=74(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 117
LDI r2, 74
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
