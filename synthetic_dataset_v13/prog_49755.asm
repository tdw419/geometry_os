; DESCRIPTION: Renders a green box of size 63x75 starting at (229, 34).
; PLAN: r0=229(x), r1=34(y), r2=63(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 34
LDI r2, 63
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
