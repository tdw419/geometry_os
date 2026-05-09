; DESCRIPTION: Renders a purple box of size 37x91 starting at (167, 25).
; PLAN: r0=167(x), r1=25(y), r2=37(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 25
LDI r2, 37
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
