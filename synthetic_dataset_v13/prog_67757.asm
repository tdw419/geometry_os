; DESCRIPTION: Renders a blue box of size 73x68 starting at (298, 75).
; PLAN: r0=298(x), r1=75(y), r2=73(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 75
LDI r2, 73
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
