; DESCRIPTION: Creates a green rectangular region at (400, 25) spanning 97 by 27 pixels.
; PLAN: r0=400(x), r1=25(y), r2=97(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 25
LDI r2, 97
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
