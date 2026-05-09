; DESCRIPTION: Renders a blue box of size 68x46 starting at (373, 9).
; PLAN: r0=373(x), r1=9(y), r2=68(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 9
LDI r2, 68
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
