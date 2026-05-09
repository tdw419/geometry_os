; DESCRIPTION: Renders a blue box of size 80x103 starting at (77, 31).
; PLAN: r0=77(x), r1=31(y), r2=80(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 31
LDI r2, 80
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
