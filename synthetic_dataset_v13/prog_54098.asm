; DESCRIPTION: Creates a green rectangular region at (171, 1) spanning 12 by 40 pixels.
; PLAN: r0=171(x), r1=1(y), r2=12(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 1
LDI r2, 12
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
