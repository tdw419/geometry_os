; DESCRIPTION: Renders a green box of size 15x117 starting at (372, 66).
; PLAN: r0=372(x), r1=66(y), r2=15(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 66
LDI r2, 15
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
