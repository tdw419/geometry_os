; DESCRIPTION: Renders a green box of size 91x34 starting at (275, 75).
; PLAN: r0=275(x), r1=75(y), r2=91(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 75
LDI r2, 91
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
