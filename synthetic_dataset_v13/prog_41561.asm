; DESCRIPTION: Renders a green box of size 19x87 starting at (208, 6).
; PLAN: r0=208(x), r1=6(y), r2=19(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 6
LDI r2, 19
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
