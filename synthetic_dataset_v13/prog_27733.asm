; DESCRIPTION: Creates a white rectangular region at (285, 133) spanning 94 by 74 pixels.
; PLAN: r0=285(x), r1=133(y), r2=94(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 133
LDI r2, 94
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
