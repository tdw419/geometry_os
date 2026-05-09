; DESCRIPTION: Creates a green rectangular region at (92, 152) spanning 53 by 35 pixels.
; PLAN: r0=92(x), r1=152(y), r2=53(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 152
LDI r2, 53
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
