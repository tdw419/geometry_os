; DESCRIPTION: Creates a yellow rectangular region at (339, 125) spanning 70 by 65 pixels.
; PLAN: r0=339(x), r1=125(y), r2=70(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 125
LDI r2, 70
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
