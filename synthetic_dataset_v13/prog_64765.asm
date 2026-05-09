; DESCRIPTION: Creates a green rectangular region at (24, 48) spanning 80 by 71 pixels.
; PLAN: r0=24(x), r1=48(y), r2=80(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 48
LDI r2, 80
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
