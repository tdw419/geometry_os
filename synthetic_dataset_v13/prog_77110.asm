; DESCRIPTION: Creates a green rectangular region at (290, 98) spanning 71 by 114 pixels.
; PLAN: r0=290(x), r1=98(y), r2=71(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 98
LDI r2, 71
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
