; DESCRIPTION: Renders a yellow box of size 86x35 starting at (179, 208).
; PLAN: r0=179(x), r1=208(y), r2=86(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 208
LDI r2, 86
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
