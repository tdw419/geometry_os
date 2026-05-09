; DESCRIPTION: Renders a green box of size 91x34 starting at (255, 63).
; PLAN: r0=255(x), r1=63(y), r2=91(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 63
LDI r2, 91
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
