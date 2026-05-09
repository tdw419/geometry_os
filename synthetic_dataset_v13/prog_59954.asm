; DESCRIPTION: Creates a green rectangular region at (253, 140) spanning 47 by 91 pixels.
; PLAN: r0=253(x), r1=140(y), r2=47(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 140
LDI r2, 47
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
