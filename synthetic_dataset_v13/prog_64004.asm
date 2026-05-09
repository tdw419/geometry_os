; DESCRIPTION: Creates a green rectangular region at (38, 3) spanning 46 by 61 pixels.
; PLAN: r0=38(x), r1=3(y), r2=46(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 3
LDI r2, 46
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
