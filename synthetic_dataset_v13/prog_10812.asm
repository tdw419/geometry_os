; DESCRIPTION: Renders a yellow box of size 33x52 starting at (206, 118).
; PLAN: r0=206(x), r1=118(y), r2=33(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 118
LDI r2, 33
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
