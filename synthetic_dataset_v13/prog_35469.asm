; DESCRIPTION: Renders a green box of size 22x21 starting at (217, 99).
; PLAN: r0=217(x), r1=99(y), r2=22(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 99
LDI r2, 22
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
