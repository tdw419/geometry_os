; DESCRIPTION: Creates a green rectangular region at (394, 149) spanning 19 by 74 pixels.
; PLAN: r0=394(x), r1=149(y), r2=19(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 149
LDI r2, 19
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
