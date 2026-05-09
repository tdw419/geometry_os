; DESCRIPTION: Renders a yellow box of size 34x27 starting at (314, 144).
; PLAN: r0=314(x), r1=144(y), r2=34(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 144
LDI r2, 34
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
