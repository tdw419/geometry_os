; DESCRIPTION: Renders a green box of size 37x114 starting at (398, 85).
; PLAN: r0=398(x), r1=85(y), r2=37(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 85
LDI r2, 37
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
