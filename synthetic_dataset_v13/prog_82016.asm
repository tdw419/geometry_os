; DESCRIPTION: Creates a green rectangular region at (178, 149) spanning 117 by 96 pixels.
; PLAN: r0=178(x), r1=149(y), r2=117(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 149
LDI r2, 117
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
