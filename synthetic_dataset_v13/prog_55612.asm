; DESCRIPTION: Renders a blue box of size 102x34 starting at (373, 115).
; PLAN: r0=373(x), r1=115(y), r2=102(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 115
LDI r2, 102
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
