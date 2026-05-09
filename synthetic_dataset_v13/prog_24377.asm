; DESCRIPTION: Renders a blue box of size 91x77 starting at (395, 83).
; PLAN: r0=395(x), r1=83(y), r2=91(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 83
LDI r2, 91
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
