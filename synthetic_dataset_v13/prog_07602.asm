; DESCRIPTION: Renders a yellow box of size 28x75 starting at (431, 126).
; PLAN: r0=431(x), r1=126(y), r2=28(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 126
LDI r2, 28
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
