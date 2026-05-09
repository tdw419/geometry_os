; DESCRIPTION: Renders a green box of size 94x22 starting at (24, 178).
; PLAN: r0=24(x), r1=178(y), r2=94(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 178
LDI r2, 94
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
