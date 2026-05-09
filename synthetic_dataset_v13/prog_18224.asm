; DESCRIPTION: Creates a green rectangular region at (408, 2) spanning 47 by 106 pixels.
; PLAN: r0=408(x), r1=2(y), r2=47(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 2
LDI r2, 47
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
