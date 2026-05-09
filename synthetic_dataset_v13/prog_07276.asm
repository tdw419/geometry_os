; DESCRIPTION: Renders a green box of size 20x14 starting at (209, 87).
; PLAN: r0=209(x), r1=87(y), r2=20(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 87
LDI r2, 20
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
