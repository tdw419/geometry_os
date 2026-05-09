; DESCRIPTION: Creates a green rectangular region at (63, 46) spanning 25 by 28 pixels.
; PLAN: r0=63(x), r1=46(y), r2=25(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 46
LDI r2, 25
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
