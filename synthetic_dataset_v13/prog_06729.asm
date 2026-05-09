; DESCRIPTION: Renders a purple box of size 58x46 starting at (275, 181).
; PLAN: r0=275(x), r1=181(y), r2=58(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 181
LDI r2, 58
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
