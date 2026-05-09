; DESCRIPTION: Renders a green box of size 43x112 starting at (110, 82).
; PLAN: r0=110(x), r1=82(y), r2=43(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 82
LDI r2, 43
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
