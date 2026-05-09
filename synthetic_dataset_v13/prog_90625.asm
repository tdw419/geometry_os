; DESCRIPTION: Creates a green rectangular region at (303, 125) spanning 55 by 79 pixels.
; PLAN: r0=303(x), r1=125(y), r2=55(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 125
LDI r2, 55
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
