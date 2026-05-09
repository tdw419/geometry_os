; DESCRIPTION: Renders a yellow box of size 20x44 starting at (383, 22).
; PLAN: r0=383(x), r1=22(y), r2=20(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 22
LDI r2, 20
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
