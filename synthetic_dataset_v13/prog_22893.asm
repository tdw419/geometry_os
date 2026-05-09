; DESCRIPTION: Renders a yellow box of size 106x112 starting at (276, 20).
; PLAN: r0=276(x), r1=20(y), r2=106(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 20
LDI r2, 106
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
