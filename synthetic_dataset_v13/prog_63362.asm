; DESCRIPTION: Creates a red rectangular region at (334, 79) spanning 52 by 94 pixels.
; PLAN: r0=334(x), r1=79(y), r2=52(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 79
LDI r2, 52
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
