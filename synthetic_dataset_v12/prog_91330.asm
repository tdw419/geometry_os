; DESCRIPTION: Renders a green box of size 98x54 starting at (34, 175).
; PLAN: r0=34(x), r1=175(y), r2=98(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 175
LDI r2, 98
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
