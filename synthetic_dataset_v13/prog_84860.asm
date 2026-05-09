; DESCRIPTION: Renders a green box of size 94x38 starting at (22, 162).
; PLAN: r0=22(x), r1=162(y), r2=94(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 162
LDI r2, 94
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
