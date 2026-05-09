; DESCRIPTION: Renders a blue box of size 102x24 starting at (151, 223).
; PLAN: r0=151(x), r1=223(y), r2=102(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 223
LDI r2, 102
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
