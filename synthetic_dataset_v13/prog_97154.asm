; DESCRIPTION: Renders a yellow box of size 20x36 starting at (247, 161).
; PLAN: r0=247(x), r1=161(y), r2=20(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 161
LDI r2, 20
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
