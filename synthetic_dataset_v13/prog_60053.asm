; DESCRIPTION: Renders a green box of size 96x117 starting at (1, 87).
; PLAN: r0=1(x), r1=87(y), r2=96(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 87
LDI r2, 96
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
