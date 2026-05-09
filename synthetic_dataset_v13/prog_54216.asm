; DESCRIPTION: Creates a green rectangular region at (57, 7) spanning 115 by 17 pixels.
; PLAN: r0=57(x), r1=7(y), r2=115(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 7
LDI r2, 115
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
