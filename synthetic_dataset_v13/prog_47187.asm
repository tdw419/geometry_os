; DESCRIPTION: Creates a green rectangular region at (126, 20) spanning 17 by 41 pixels.
; PLAN: r0=126(x), r1=20(y), r2=17(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 20
LDI r2, 17
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
