; DESCRIPTION: Creates a green rectangular region at (50, 144) spanning 44 by 71 pixels.
; PLAN: r0=50(x), r1=144(y), r2=44(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 144
LDI r2, 44
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
