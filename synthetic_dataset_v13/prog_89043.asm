; DESCRIPTION: Creates a green rectangular region at (38, 186) spanning 28 by 21 pixels.
; PLAN: r0=38(x), r1=186(y), r2=28(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 186
LDI r2, 28
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
