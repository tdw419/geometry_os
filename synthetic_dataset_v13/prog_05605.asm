; DESCRIPTION: Creates a green rectangular region at (46, 52) spanning 109 by 85 pixels.
; PLAN: r0=46(x), r1=52(y), r2=109(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 52
LDI r2, 109
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
