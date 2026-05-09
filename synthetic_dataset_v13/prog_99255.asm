; DESCRIPTION: Creates a yellow rectangular region at (419, 75) spanning 55 by 113 pixels.
; PLAN: r0=419(x), r1=75(y), r2=55(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 75
LDI r2, 55
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
