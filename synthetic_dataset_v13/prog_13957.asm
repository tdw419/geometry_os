; DESCRIPTION: Renders a green box of size 23x13 starting at (79, 209).
; PLAN: r0=79(x), r1=209(y), r2=23(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 209
LDI r2, 23
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
