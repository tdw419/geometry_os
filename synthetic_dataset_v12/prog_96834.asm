; DESCRIPTION: Creates a green rectangular region at (152, 72) spanning 115 by 10 pixels.
; PLAN: r0=152(x), r1=72(y), r2=115(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 72
LDI r2, 115
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
