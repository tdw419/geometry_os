; DESCRIPTION: Creates a green rectangular region at (24, 7) spanning 83 by 61 pixels.
; PLAN: r0=24(x), r1=7(y), r2=83(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 7
LDI r2, 83
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
