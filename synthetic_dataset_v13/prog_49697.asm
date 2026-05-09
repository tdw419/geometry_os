; DESCRIPTION: Creates a green rectangular region at (151, 46) spanning 117 by 70 pixels.
; PLAN: r0=151(x), r1=46(y), r2=117(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 46
LDI r2, 117
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
