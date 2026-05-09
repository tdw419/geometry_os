; DESCRIPTION: Renders a yellow box of size 110x57 starting at (290, 52).
; PLAN: r0=290(x), r1=52(y), r2=110(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 52
LDI r2, 110
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
