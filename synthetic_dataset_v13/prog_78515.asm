; DESCRIPTION: Renders a green box of size 115x59 starting at (371, 179).
; PLAN: r0=371(x), r1=179(y), r2=115(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 179
LDI r2, 115
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
