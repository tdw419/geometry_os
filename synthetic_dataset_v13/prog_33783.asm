; DESCRIPTION: Creates a yellow rectangular region at (143, 75) spanning 12 by 75 pixels.
; PLAN: r0=143(x), r1=75(y), r2=12(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 75
LDI r2, 12
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
