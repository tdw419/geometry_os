; DESCRIPTION: Renders a purple box of size 77x103 starting at (369, 21).
; PLAN: r0=369(x), r1=21(y), r2=77(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 21
LDI r2, 77
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
