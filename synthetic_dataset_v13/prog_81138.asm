; DESCRIPTION: Creates a green rectangular region at (374, 161) spanning 92 by 25 pixels.
; PLAN: r0=374(x), r1=161(y), r2=92(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 161
LDI r2, 92
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
