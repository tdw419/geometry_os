; DESCRIPTION: Renders a green box of size 44x34 starting at (315, 10).
; PLAN: r0=315(x), r1=10(y), r2=44(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 10
LDI r2, 44
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
