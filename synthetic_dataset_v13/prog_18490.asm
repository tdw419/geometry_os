; DESCRIPTION: Creates a black rectangular region at (229, 149) spanning 70 by 75 pixels.
; PLAN: r0=229(x), r1=149(y), r2=70(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 149
LDI r2, 70
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
