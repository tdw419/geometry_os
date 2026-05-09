; DESCRIPTION: Creates a green rectangular region at (401, 35) spanning 25 by 80 pixels.
; PLAN: r0=401(x), r1=35(y), r2=25(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 35
LDI r2, 25
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
