; DESCRIPTION: Creates a green rectangular region at (239, 20) spanning 79 by 11 pixels.
; PLAN: r0=239(x), r1=20(y), r2=79(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 20
LDI r2, 79
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
