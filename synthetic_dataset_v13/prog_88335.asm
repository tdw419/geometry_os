; DESCRIPTION: Renders a green box of size 91x73 starting at (178, 176).
; PLAN: r0=178(x), r1=176(y), r2=91(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 176
LDI r2, 91
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
