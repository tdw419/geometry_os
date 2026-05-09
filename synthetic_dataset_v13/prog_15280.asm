; DESCRIPTION: Creates a green rectangular region at (368, 152) spanning 48 by 38 pixels.
; PLAN: r0=368(x), r1=152(y), r2=48(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 152
LDI r2, 48
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
