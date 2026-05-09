; DESCRIPTION: Creates a green rectangular region at (426, 39) spanning 75 by 64 pixels.
; PLAN: r0=426(x), r1=39(y), r2=75(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 39
LDI r2, 75
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
