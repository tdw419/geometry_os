; DESCRIPTION: Renders a green box of size 13x92 starting at (438, 110).
; PLAN: r0=438(x), r1=110(y), r2=13(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 110
LDI r2, 13
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
