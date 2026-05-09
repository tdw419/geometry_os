; DESCRIPTION: Renders a green box of size 37x66 starting at (229, 151).
; PLAN: r0=229(x), r1=151(y), r2=37(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 151
LDI r2, 37
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
