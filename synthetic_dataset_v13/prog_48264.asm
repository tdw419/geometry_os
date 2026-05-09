; DESCRIPTION: Renders a yellow box of size 54x68 starting at (14, 157).
; PLAN: r0=14(x), r1=157(y), r2=54(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 157
LDI r2, 54
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
