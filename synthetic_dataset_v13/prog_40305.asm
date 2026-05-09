; DESCRIPTION: Renders a green box of size 62x75 starting at (91, 32).
; PLAN: r0=91(x), r1=32(y), r2=62(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 32
LDI r2, 62
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
