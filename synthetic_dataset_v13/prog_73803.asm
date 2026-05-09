; DESCRIPTION: Renders a green box of size 106x16 starting at (185, 99).
; PLAN: r0=185(x), r1=99(y), r2=106(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 99
LDI r2, 106
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
