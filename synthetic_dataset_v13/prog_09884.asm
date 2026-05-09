; DESCRIPTION: Creates a green rectangular region at (367, 106) spanning 25 by 65 pixels.
; PLAN: r0=367(x), r1=106(y), r2=25(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 106
LDI r2, 25
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
