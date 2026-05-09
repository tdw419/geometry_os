; DESCRIPTION: Creates a green rectangular region at (209, 109) spanning 80 by 28 pixels.
; PLAN: r0=209(x), r1=109(y), r2=80(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 109
LDI r2, 80
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
