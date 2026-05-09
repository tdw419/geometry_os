; DESCRIPTION: Renders a blue box of size 77x57 starting at (364, 103).
; PLAN: r0=364(x), r1=103(y), r2=77(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 103
LDI r2, 77
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
