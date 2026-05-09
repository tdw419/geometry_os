; DESCRIPTION: Creates a green rectangular region at (46, 15) spanning 98 by 18 pixels.
; PLAN: r0=46(x), r1=15(y), r2=98(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 15
LDI r2, 98
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
