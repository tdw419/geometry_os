; DESCRIPTION: Renders a yellow box of size 61x68 starting at (325, 125).
; PLAN: r0=325(x), r1=125(y), r2=61(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 125
LDI r2, 61
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
