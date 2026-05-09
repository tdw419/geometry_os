; DESCRIPTION: Creates a green rectangular region at (328, 12) spanning 78 by 79 pixels.
; PLAN: r0=328(x), r1=12(y), r2=78(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 12
LDI r2, 78
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
