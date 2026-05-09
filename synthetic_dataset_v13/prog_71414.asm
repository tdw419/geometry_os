; DESCRIPTION: Renders a green box of size 20x16 starting at (313, 123).
; PLAN: r0=313(x), r1=123(y), r2=20(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 123
LDI r2, 20
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
