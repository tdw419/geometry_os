; DESCRIPTION: Renders a blue box of size 77x115 starting at (245, 103).
; PLAN: r0=245(x), r1=103(y), r2=77(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 103
LDI r2, 77
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
