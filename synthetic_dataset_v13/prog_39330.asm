; DESCRIPTION: Creates a green rectangular region at (76, 152) spanning 47 by 40 pixels.
; PLAN: r0=76(x), r1=152(y), r2=47(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 152
LDI r2, 47
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
