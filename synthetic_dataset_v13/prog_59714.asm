; DESCRIPTION: Renders a yellow box of size 56x12 starting at (71, 196).
; PLAN: r0=71(x), r1=196(y), r2=56(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 196
LDI r2, 56
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
