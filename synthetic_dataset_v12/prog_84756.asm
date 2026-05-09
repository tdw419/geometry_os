; DESCRIPTION: Creates a green rectangular region at (277, 159) spanning 99 by 75 pixels.
; PLAN: r0=277(x), r1=159(y), r2=99(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 159
LDI r2, 99
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
