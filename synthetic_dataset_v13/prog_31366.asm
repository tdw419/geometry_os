; DESCRIPTION: Renders a yellow box of size 80x68 starting at (144, 153).
; PLAN: r0=144(x), r1=153(y), r2=80(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 153
LDI r2, 80
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
