; DESCRIPTION: Creates a white rectangular region at (142, 161) spanning 94 by 75 pixels.
; PLAN: r0=142(x), r1=161(y), r2=94(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 161
LDI r2, 94
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
