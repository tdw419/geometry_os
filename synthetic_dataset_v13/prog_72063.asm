; DESCRIPTION: Creates a green rectangular region at (373, 152) spanning 79 by 101 pixels.
; PLAN: r0=373(x), r1=152(y), r2=79(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 152
LDI r2, 79
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
