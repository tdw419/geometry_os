; DESCRIPTION: Renders a green box of size 80x68 starting at (349, 112).
; PLAN: r0=349(x), r1=112(y), r2=80(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 112
LDI r2, 80
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
