; DESCRIPTION: Renders a green box of size 18x119 starting at (236, 104).
; PLAN: r0=236(x), r1=104(y), r2=18(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 104
LDI r2, 18
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
