; DESCRIPTION: Renders a green box of size 25x59 starting at (201, 47).
; PLAN: r0=201(x), r1=47(y), r2=25(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 47
LDI r2, 25
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
