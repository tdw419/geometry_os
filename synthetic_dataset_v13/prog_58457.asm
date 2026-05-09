; DESCRIPTION: Creates a green rectangular region at (221, 152) spanning 99 by 86 pixels.
; PLAN: r0=221(x), r1=152(y), r2=99(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 152
LDI r2, 99
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
