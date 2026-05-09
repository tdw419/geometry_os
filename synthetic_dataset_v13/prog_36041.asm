; DESCRIPTION: Renders a blue box of size 40x46 starting at (380, 156).
; PLAN: r0=380(x), r1=156(y), r2=40(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 156
LDI r2, 40
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
