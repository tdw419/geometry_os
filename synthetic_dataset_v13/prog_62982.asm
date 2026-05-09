; DESCRIPTION: Renders a blue box of size 36x34 starting at (129, 215).
; PLAN: r0=129(x), r1=215(y), r2=36(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 215
LDI r2, 36
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
