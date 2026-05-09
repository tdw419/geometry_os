; DESCRIPTION: Renders a green box of size 28x73 starting at (110, 183).
; PLAN: r0=110(x), r1=183(y), r2=28(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 183
LDI r2, 28
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
