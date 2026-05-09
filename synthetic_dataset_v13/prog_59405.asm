; DESCRIPTION: Creates a green rectangular region at (57, 127) spanning 31 by 96 pixels.
; PLAN: r0=57(x), r1=127(y), r2=31(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 127
LDI r2, 31
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
