; DESCRIPTION: Renders a green box of size 39x40 starting at (163, 162).
; PLAN: r0=163(x), r1=162(y), r2=39(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 162
LDI r2, 39
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
