; DESCRIPTION: Renders a yellow box of size 11x34 starting at (63, 125).
; PLAN: r0=63(x), r1=125(y), r2=11(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 125
LDI r2, 11
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
