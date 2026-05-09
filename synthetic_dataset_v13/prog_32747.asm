; DESCRIPTION: Creates a green rectangular region at (146, 155) spanning 114 by 18 pixels.
; PLAN: r0=146(x), r1=155(y), r2=114(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 155
LDI r2, 114
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
