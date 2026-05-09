; DESCRIPTION: Renders a black box of size 12x110 starting at (431, 113).
; PLAN: r0=431(x), r1=113(y), r2=12(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 113
LDI r2, 12
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
