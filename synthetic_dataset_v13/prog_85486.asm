; DESCRIPTION: Renders a purple box of size 102x22 starting at (275, 40).
; PLAN: r0=275(x), r1=40(y), r2=102(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 40
LDI r2, 102
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
