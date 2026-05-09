; DESCRIPTION: Renders a yellow box of size 34x117 starting at (278, 125).
; PLAN: r0=278(x), r1=125(y), r2=34(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 125
LDI r2, 34
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
