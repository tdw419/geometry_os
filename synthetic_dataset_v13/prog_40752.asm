; DESCRIPTION: Creates a yellow rectangular region at (317, 127) spanning 75 by 112 pixels.
; PLAN: r0=317(x), r1=127(y), r2=75(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 127
LDI r2, 75
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
