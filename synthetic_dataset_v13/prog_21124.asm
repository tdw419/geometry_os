; DESCRIPTION: Renders a green box of size 80x74 starting at (431, 6).
; PLAN: r0=431(x), r1=6(y), r2=80(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 6
LDI r2, 80
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
