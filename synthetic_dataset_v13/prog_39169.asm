; DESCRIPTION: Creates a green rectangular region at (81, 127) spanning 26 by 104 pixels.
; PLAN: r0=81(x), r1=127(y), r2=26(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 127
LDI r2, 26
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
