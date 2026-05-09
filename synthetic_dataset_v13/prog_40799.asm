; DESCRIPTION: Creates a yellow rectangular region at (273, 127) spanning 93 by 110 pixels.
; PLAN: r0=273(x), r1=127(y), r2=93(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 127
LDI r2, 93
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
