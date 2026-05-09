; DESCRIPTION: Creates a green rectangular region at (148, 152) spanning 19 by 46 pixels.
; PLAN: r0=148(x), r1=152(y), r2=19(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 152
LDI r2, 19
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
