; DESCRIPTION: Renders a blue box of size 56x34 starting at (214, 124).
; PLAN: r0=214(x), r1=124(y), r2=56(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 124
LDI r2, 56
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
